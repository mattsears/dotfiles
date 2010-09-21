#!/usr/bin/env ruby
# hero.rb
# Evadne Wu at Iridia, 2010

HEROKU_HOME = "#{ENV['HOME']}/.heroku"
CREDENTIALS_FILE = "#{HEROKU_HOME}/credentials"
PLAUSIBLE_ACCOUNT = ARGV.empty? ? "" : ARGV.first
PLAUSIBLE_CREDENTIAL_FILE = "#{HEROKU_HOME}/#{PLAUSIBLE_ACCOUNT}.herokuCredential"

if ARGV.empty?
  if File.exists? CREDENTIALS_FILE
    credentialsFile = File.open(CREDENTIALS_FILE, 'r')
    accountName = credentialsFile.readline.gsub!(/[\n]+/, "")
    puts "Operating under #{accountName}."
  else
    puts "Heroku credentials not found."
  end
elsif File.exists? PLAUSIBLE_CREDENTIAL_FILE
  system "cp -f #{PLAUSIBLE_CREDENTIAL_FILE} #{CREDENTIALS_FILE}"
else
  puts "Heroku credentials for account #{PLAUSIBLE_ACCOUNT} not found."
end
