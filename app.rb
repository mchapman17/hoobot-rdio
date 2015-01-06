require 'sinatra'
require 'json'
require 'omniauth'
require 'omniauth-rdio'

use Rack::Session::Cookie, key: 'rack.session',
                           domain: 'localhost',
                           path: '/',
                           expire_after: 2592000, # In seconds
                           secret: 'something123'

use OmniAuth::Builder do
  provider :rdio, ENV["hoobot_rdio_consumer"], ENV["hoobot_rdio_secret"]
end

get '/auth' do
  verifier = request.env['rack.request.query_hash']['oauth_verifier']
  token = request.env['rack.request.query_hash']['oauth_token']

  auth = request.env['omniauth.auth']

  request.env.to_s
end