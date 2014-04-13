EchoNestApi = require './lib/echo_nest'

en = new EchoNestApi apiKey: process.env['ECHONEST_API_KEY']

en.findSongForDate new Date(), (err, data) ->
  throw err if err
  data.response.songs.forEach (track) ->
    console.log track.title, 'by', track.artist_name
