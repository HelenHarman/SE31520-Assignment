### runTests.py
# Runs the cucumber tests.
# Saves the results into a database
# Creates a graph out of the results.
#
# @author Helen Harman (heh14@aber.ac.uk)
# @created 10 November 2014
# @last_modified 25 Novuember 2014


import os
import sqlite3 as sql
import re
from datetime import datetime

import createGraphs

RESULTS_FILE_PATHNAME = "results/tests.txt"
COVERAGE_FILE_PATHNAME = "../coverage/index.html"
DATABASE_PATHNAME = "results/testResults.db"

#-------------------------------------------------------------------------------------

##
# Parses the file where the results are stored, and saves the results to the testResults database.
def saveResultsToDB():
    # insert the results into the database
    resultsFile = open(RESULTS_FILE_PATHNAME, 'r')
    num_scenarios, scenarios_passed, num_steps, steps_passed, count = 0, 0, 0, 0, 0 #initialize all variables to 0. count keeps count of what line in the file we are in
    lines = resultsFile.readlines()
    for line in lines:
        count = count + 1
        # get the number of scenarios ran
        result = re.match('(?P<num>^[0-9]+) scenarios', line) #example line to find : "2 scenarios (2 passed)"
        if result:
            print line
            num_scenarios = result.group('num')
            # get the number of scenarios passed
            scenarios_passed = getNumberOfPassesFromString(line)
            
            # get the number of steps
            result = re.match('(?P<num>^[0-9]+) steps', lines[count])
            if result :
                print lines[count]
                num_steps = result.group('num')
                # get the number of steps passed
                steps_passed = getNumberOfPassesFromString(lines[count])
                print steps_passed
        
            # insert data into database
            dbConnection = sql.connect(DATABASE_PATHNAME)
            cur = dbConnection.cursor()
            cur.execute('INSERT INTO results(num_scenarios, scenarios_passed, num_steps, steps_passed, coverage) VALUES(' + str(num_scenarios) + ',' + str(scenarios_passed) + ',' + str(num_steps) + ',' + str(steps_passed) + ',' + str(getCoverage()) + ');')
            dbConnection.commit()
            dbConnection.close()
            break # we have found the steps and the scenarios for this run, so no need to evaluate the rest of the lines.

#-------------------------------------------------------------------------------------

##
# Find the number of tests passed within the given string
def getNumberOfPassesFromString(string):
    checkForPasses = re.match('.+[ (](?P<num>[0-9]+) passed', string)
    if checkForPasses:
        return checkForPasses.group('num')
    else:
        return 0

#-------------------------------------------------------------------------------------

##
# Parses the coverage index file, to find the percentage of lines covered by the tests
def getCoverage():
    coverageFile = open(COVERAGE_FILE_PATHNAME, 'r')
    for line in coverageFile:
        # get the number of scenarios ran
        result = re.match('.+<span class="covered_percent"><span.+(?P<num>[0-9][0-9][0-9]*\.[0-9][0-9]*)%</span></span>', line)
        if result:
            num_scenarios = result.group('num')
            return num_scenarios

#-------------------------------------------------------------------------------------

os.system("rake cucumber > " + RESULTS_FILE_PATHNAME)#runs the cucumber tests
saveResultsToDB()
createGraphs.createGraphs(DATABASE_PATHNAME)

