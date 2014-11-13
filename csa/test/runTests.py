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
#
def saveResultsToDB():
    # insert the results into the database
    resultsFile = open(RESULTS_FILE_PATHNAME, 'r')
    num_scenarios = 0
    scenarios_passed = 0
    num_steps = 0
    steps_passed = 0
    lines = resultsFile.readlines()
    count = 0
    for line in lines:
        count = count + 1
        # get the number of scenarios ran
        result = re.match('(?P<num>^[0-9]+) scenarios', line) #example line to find : "2 scenarios (2 passed)"
        if result:
            num_scenarios = result.group('num')
            
            # get the number of scenarios passed
            scenarios_passed = getNumberOfPassesFromString(line)
        
            # get the number of steps
            line = lines[count]
            result = re.match('(?P<num>^[0-9]+) steps', line)
            if result:
                num_steps = result.group('num')
                # get the number of steps passed
                steps_passed = getNumberOfPassesFromString(line)
                print steps_passed
        
            # insert data into database
            dbConnection = sql.connect(DATABASE_PATHNAME)
            cur = dbConnection.cursor()
            cur.execute('INSERT INTO results(num_scenarios, scenarios_passed, num_steps, steps_passed, coverage) VALUES(' + str(num_scenarios) + ',' + str(scenarios_passed) + ',' + str(num_steps) + ',' + str(steps_passed) + ',' + str(getCoverage()) + ');')
            dbConnection.commit()
            dbConnection.close()
            break

#-------------------------------------------------------------------------------------

def getNumberOfPassesFromString(string):
    checkForPasses = re.match('.+[ (](?P<num>[0-9]+) passed', string)
    if checkForPasses:
        return checkForPasses.group('num')
    else:
        return 0

#-------------------------------------------------------------------------------------

##
#
def getCoverage():
    coverageFile = open(COVERAGE_FILE_PATHNAME, 'r')
    for line in coverageFile:
        # get the number of scenarios ran
        result = re.match('.+<span class="covered_percent"><span.+(?P<num>[0-9][0-9][0-9]*\.[0-9][0-9]*)%</span></span>', line)
        if result:
            num_scenarios = result.group('num')
            return num_scenarios

#-------------------------------------------------------------------------------------

#run the cucumber tests
os.system("rake cucumber > " + RESULTS_FILE_PATHNAME)
saveResultsToDB()
createGraphs.createGraphs(DATABASE_PATHNAME)

