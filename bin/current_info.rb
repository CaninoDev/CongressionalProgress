require 'date'
require 'pry'
require_relative '../app/model/congress'

NEW_SESSION_MONTH = 1
NEW_SESSION_DAY = 3
START_YEAR = 1789

def current_info
  session = calculate_current_session
  ordinal_suffix = get_ord_suffix(session)
  puts "\nThis is currently the #{session}#{ordinal_suffix} Congress with tne following party composition:"
end

def calculate_current_session
  time = Time.now
  current_month = time.month
  current_day = time.day
  current_year = time.year
  if current_day < NEW_SESSION_DAY && current_month == NEW_SESSION_MONTH
    binding.pry
    ((current_year - START_YEAR) / 2)
  else
    ((current_year - START_YEAR) / 2) + 1
  end
end

def get_ord_suffix(num)
  digit = num % 10
  case digit
  when 1
    return "st"
  when 2
    return "nd"
  when 3
    return "rd"
  else
    return "th"
  end
end
