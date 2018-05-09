#/usr/bin/env ruby
require 'pry'
require_relative "welcome"
require_relative "current_info"
require_relative "get_district"

welcome
current_info
address = get_address
get_district(address)



