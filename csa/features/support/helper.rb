require 'date'
##
# returns for example 12:30
def getHoursAndMins()
    current_time = DateTime.now
    current_time.strftime "%H:%M"
end

