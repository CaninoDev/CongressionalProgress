def welcome
  file = File.open("Seal.txt", "r")
  banner = file.read
  puts banner
end


