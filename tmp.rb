require 'json'
require 'date'
require 'net/http'
require 'faraday'

Dir['./fixtures/tmp-*'].each do |file|
  name = File.basename file
  a = name.split '-'
  data = DateTime.strptime("#{a[1]}-#{a[2]}-#{a[3]}T#{a[4]}:#{a[5]}:#{a[6]}+02:00", '%Y-%m-%dT%H:%M:%S%z')
  str = "#{a[1]}-#{a[2]}-#{a[3]}T#{a[4]}:#{a[5]}:#{a[6]}+02:00"

  f = File.read file
  jsonf = JSON.parse f

  jsonf["time"] = str
  puts jsonf.to_s
  conn = Faraday.new(:url => 'http://localhost:4567')
  conn.post do |req|
    req.url '/speedtests'
    req.headers['Content-Type'] = 'application/json'
    req.body = JSON.generate jsonf
  end
end
