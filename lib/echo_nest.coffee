qs = require 'querystring'
request = require 'request'
{extend} = require 'underscore'
{getDurationFromDate} = require './helpers'


class EchoNest
  BASE_URL = 'http://developer.echonest.com/api/v4/'

  constructor: (options) ->
    throw new Error "Must specify apiKey" unless @apiKey = options.apiKey

  fetch: (endpoint, options={}, cb) ->
    queryOptions =
      api_key: @apiKey
      format: 'json'

    queryString = qs.stringify extend {}, queryOptions, options

    requestOptions =
      url: "#{BASE_URL}#{endpoint}?#{queryString}"
      json: true

    request requestOptions, (err, res, body) ->
      cb err, body

  songSearch: (options, cb) ->
    @fetch 'song/search', options, cb

  findSongForToday: (cb) ->
    duration = getDurationFromDate new Date()
    options =
      results: 10
      sort: 'song_hotttnesss-desc'
      bucket: ['audio_summary']
      max_duration: duration + 0.499
      min_duration: duration - 0.5

    @songSearch options, cb


module.exports = EchoNest
