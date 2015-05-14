# A HTTP Client in Ruby


require 'socket'
require 'uri'

print "Enter a domain: (default is 'cogentia.io'):"

input = gets.chomp
url = URI.parse("http://#{input.empty? ? 'cogentia.io' : input}/")
puts "Downloading #{url.to_s} =="

connection = TCPSocket.new url.host, 80
connection.puts "GET / HTTP/1.1"
connection.puts "Host: #{url.host}"
connection.puts "Connection: close" # Tell server to close connection when done.
connection.puts "\n"                # Empty line to indicate end of request.

while line = connection.gets
  puts line # Print the response data until we run out of text.
end

puts "Done downloading #{url.to_s}"
connection.close
