ENV['RACK_ENV'] ||= 'development'

require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym

require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'date'

require './models.rb'

set :database, "sqlite3:speedtestdb.sqlite3"


get '/' do
  erb :index
end

get '/speedtests' do
  @speedtests = SpeedTest.all.order "time ASC"
  erb :list
end

post '/speedtests' do
  request.body.rewind
  @payload = JSON.parse request.body.read
  @speedtest = SpeedTest.create(download: @payload['speeds']['download'],
                            upload: @payload['speeds']['upload'],
                            originalDownload: @payload['speeds']['originalDownload'],
                            originalUpload: @payload['speeds']['originalUpload'],
                            ip: @payload['client']['ip'],
                            lat: @payload['client']['lat'],
                            lon: @payload['client']['lon'],
                            isp: @payload['client']['isp'],
                            isprating: @payload['client']['isprating'],
                            rating: @payload['client']['rating'],
                            ispdlavg: @payload['client']['ispdlavg'],
                            ispulavg: @payload['client']['ispulavg'],
                            host: @payload['server']['host'],
                            hlat: @payload['server']['lat'],
                            hlon: @payload['server']['lon'],
                            location: @payload['server']['location'],
                            country: @payload['server']['country'],
                            cc: @payload['server']['cc'],
                            sponsor: @payload['server']['sponsor'],
                            distance: @payload['server']['distance'],
                            distanceMi: @payload['server']['distanceMi'],
                            ping: @payload['server']['ping'],
                            idh: @payload['server']['id'],
                            time: DateTime.now)
end
