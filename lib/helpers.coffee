getDurationFromDate = (date) ->
  getDurationInSeconds date.getMonth() + 1, date.getDate()

getDurationInSeconds = (minutes, seconds) ->
  minutes * 60 + seconds


module.exports = {getDurationFromDate}
