### createGraphs.py
# Creates a graph out of the results for running the cucumber tests.
# Used by runTests.py
#
# @author Helen Harman (heh14@aber.ac.uk)
# @created 10 November 2014
# @last_modified 25 Novuember 2014

from datetime import datetime
import sqlite3 as sql

from matplotlib.dates import datetime as dt
import matplotlib.patches as mpatches
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from matplotlib.dates import DayLocator, HourLocator, DateFormatter, drange

#-------------------------------------------------------------------------------------

##
# Creates and displays the graphs of the test results and the coverage.
def createGraphs(DATABASE_PATHNAME):
    # create and display a graph of how the results have changed over time.
    # get all the results from the database
    dbConnection = sql.connect(DATABASE_PATHNAME)
    cur = dbConnection.cursor()
    cur.execute('SELECT * FROM results;')
    results = cur.fetchall()
    num_scenarios, scenarios_passed, raw_dates, coverage, num_steps, steps_passed = [], [], [], [], [], []
    for result in results: # get all the results from querying the database in to the correct arrays.
        num_scenarios.append(result[1])
        scenarios_passed.append(result[2])
        num_steps.append(result[4])
        steps_passed.append(result[5])
        coverage.append(result[7])
        raw_dates.append(result[8])
    dbConnection.close()
    
    # plot a graph to show the results
    fig, (ax, ax3, ax2) = plt.subplots(1, 3, sharey=False, figsize=(13, 7), dpi=100)

    x = [dt.datetime.strptime(d, '%Y-%m-%d %H:%M:%S') for d in raw_dates] # Sets the data format to a format understood by matplotlib

    createScenariosGraph(ax, num_scenarios, scenarios_passed, x)
    createCoverageGraph(ax2, coverage, x)
    createStepsGraph(ax3, num_steps, steps_passed, x)

    fig.autofmt_xdate() # will give the time when zoomed into area of the graph, otherwise the date will be shown
    plt.show()

#-------------------------------------------------------------------------------------

##
# Plots the number of scenarios and the number of scenarios passed graph
def createScenariosGraph(ax, num_scenarios, scenarios_passed, x):
    
    line_up, = ax.plot(x, num_scenarios, label='Number of Scenarios')
    line_down, = ax.plot(x, scenarios_passed, label='Number of Passed Scenarios')
    
    createLegend(ax)
    
    ax.set_ylabel('Number of Scenarios')
    ax.set_xlabel('Date/Time of Test execution')
    ax.set_ylim(0,max(num_scenarios)+2)
    ax.set_title('Number of scenarios passed')

#-------------------------------------------------------------------------------------

##
# Plots the coverage graph
def createCoverageGraph(ax2, coverage, x):
    # plot the coverage over time graph
    ax2.plot(x, coverage, label='coverage')
    ax2.set_ylabel('Coverage percentage')
    ax2.set_xlabel('Date/Time of Test execution')
    ax2.set_ylim(0,max(coverage)+10)
    ax2.set_title('Test Coverage')

#-------------------------------------------------------------------------------------

##
# Plots the number of steps and the number of steps passed graph
def createStepsGraph(ax3, num_steps, steps_passed, x):
    # plot the coverage over time graph
    ax3LineUp = ax3.plot(x, num_steps, label='Number of Steps')
    ax3LineDown = ax3.plot(x, steps_passed, label='Number of Passed Steps')
    
    #create the legend
    createLegend(ax3)
    
    ax3.set_ylabel('Number of steps')
    ax3.set_xlabel('Date/Time of Test execution')
    ax3.set_ylim(0,max(num_steps)+2)
    ax3.set_title('Number of steps passed')

#-------------------------------------------------------------------------------------

##
# Sets up the legend for the scenarios and steps graphs.
def createLegend(ax):
    legend = ax.legend(bbox_to_anchor=(0.98, 0.98), loc=1, borderaxespad=0., prop={'size':4})
    for label in legend.get_texts():
        label.set_fontsize('x-small')
    for label in legend.get_lines():
        label.set_linewidth(1.5)



