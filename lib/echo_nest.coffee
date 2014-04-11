qs = require 'querystring'
request = require 'request'
{extend} = require 'underscore'


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


module.exports = EchoNest
