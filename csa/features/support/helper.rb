require 'date'

def getHoursAndMins()
    current_time = DateTime.now
    current_time.strftime "%H:%M"
end

