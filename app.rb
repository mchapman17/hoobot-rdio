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
  provider :rdio, "he48cun99f34s44mghhc8449", "dQvxXN7Teq"
end

post '/auth' do
  verifier = request.env['rack.request.query_hash']['oauth_verifier']
  token = request.env['rack.request.query_hash']['oauth_token']

  auth = request.env['omniauth.auth']

  request.env.to_s
end