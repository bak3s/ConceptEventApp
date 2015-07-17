ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require_relative 'speakers.rb'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Speakers' do
  it 'Should return JSON' do
    get '/speakers/1'
    last_response.headers['Content-Type']
      .must_equal 'application/json'
  end
  it 'Should return a speaker named Joe' do
    get '/speakers/1'
    speaker_info = { id: 1, name: 'Joe', title: 'Chief', company: 'Grattan Institute', avatar: 'image.jpg' }
    speaker_info.to_json.must_equal last_response.body
  end
end