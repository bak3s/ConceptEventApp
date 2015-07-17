require 'sinatra'
require 'json'

get '/speakers/:speaker' do
  content_type :json
  speaker = params[:speaker].to_i
  { id: speaker, name: 'Joe', title: 'Chief', company: 'Grattan Institute', avatar: 'image.jpg' }.to_json
end