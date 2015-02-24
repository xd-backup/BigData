#!/usr/bin/env ruby

require 'optparse'
require 'rpcjson'

options = {}
#default options
options[:host] = '127.0.0.1'
options[:port] = 8332
options[:username] = 'rpcuser'
options[:password] = 'rpcpassword'

option_parser = OptionParser.new do |opts|
  opts.banner = 'Bitcoind Extractor powered by Ruby'
  
  opts.on('-n HEIGHT', '--height HEIGHT', 'Extract 0 to HEIGHT-1 blocks') do |value|
    options[:height] = value.to_i()
  end

  opts.on('-i HOST', '--host HOST', 'Bitcoind RPC host') do |value|
    options[:host] = value
  end

  opts.on('-o PORT', '--port PORT', 'Bitcoind RPC port') do |value|
    options[:host] = value.to_i()
  end

  opts.on('-u USERNAME', '--username USERNAME', 'Bitcoind RPC username') do |value|
    options[:username] = value
  end

  opts.on('-p PASSWORD', '--password PASSWORD', 'Bitcoind RPC password') do |value|
    options[:password] = value
  end
end.parse!

rpcClient = RPC::JSON::Client.new 'http://' + options[:username] + ':' + options[:password] + '@' + options[:host] + ':' + options[:port].to_s(), 1.1

puts rpcClient.getblockcount
