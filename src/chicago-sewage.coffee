# Description:
#   A way to see if raw sewage is being dumped into Chicago rivers right now
#
# Commands:
#   hubot sewage - Prints if raw sewage is being dumped into Chicago rivers, and if so, where it's being dumped
#   hubot sewage <date> - Same as above, but for a specific date (date format is "MM/DD/YYYY")
#
# Notes:
#   Thanks to everyone at http://istheresewageinthechicagoriver.com/ for the API!
#
# Author:
#   Bill Rastello <wjr1985@gmail.com>

sewageMe = (msg, date, callback) ->
  date = date.trim()
  msg.http("http://istheresewageinthechicagoriver.com/cso-status/?date=#{date}")
    .get() (err, res, body) ->
      if err
        msg.send "Error: Unable to reach server"
        return
      if res.statusCode isnt 200
        msg.send "Error #{res.statusCode} - Too much sewage?"
        return
      sewage = JSON.parse(body)
      message = ""
      if sewage["is-there-sewage"] == "yes"
        events = ""
        for event in sewage["cso-events"]
          description = if event.description then event.description else "No details"
          events += "#{event.riverway}: #{description}\n"
        callback true, events
      else
        callback false

module.exports = (robot) ->
  robot.respond /sewage$/i, (msg) ->
    sewageMe msg, "", (sewage, events) ->
      if sewage
        msg.send "There is raw sewage being dumped into Chicago rivers!\n#{events}"
      else
        msg.send "There is no raw sewage being dumped into Chicago rivers."

  robot.respond /sewage (.*)/i, (msg) ->
    date = msg.match[1]
    sewageMe msg, date, (sewage, events) ->
      if sewage
        msg.send "There was raw sewage dumped into Chicago rivers on #{date}!\n#{events}"
      else
        msg.send "There was no raw sewage dumped into Chicago rivers on #{date}."
