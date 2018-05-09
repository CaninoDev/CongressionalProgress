require 'google/apis/civicinfo_v2'
require_relative '../config/resources_and_keys'
Civicinfo = Google::Apis::CivicinfoV2 # Alias the module

# This method will retrieve the congressional district of an address
def get_district(address)
  service = Civicinfo::CivicInfoService.new
  service.key = GOOGLE_CIVIC_API_KEY
  information = service.representative_info_by_address(address: address)
  puts information
end

def get_address
  print "Please type your full address sans name: "
  gets.chomp
end
