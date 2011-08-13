#!/usr/bin/env ruby
# hero.rb

HEROKU_HOME = "#{ENV['HOME']}/.heroku"
CREDENTIALS_FILE = "#{HEROKU_HOME}/credentials"
PLAUSIBLE_ACCOUNT = ARGV.empty? ? "" : ARGV.first
PLAUSIBLE_CREDENTIAL_FILE = "#{HEROKU_HOME}/#{PLAUSIBLE_ACCOUNT}.herokuCredential"
SSH_PATH = File.join ENV['HOME'], ".ssh"
ACCOUNT_IDENTITY = "id_rsa_heroku_#{PLAUSIBLE_ACCOUNT}"

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

if File.exists?(File.join(SSH_PATH, "#{ACCOUNT_IDENTITY}.identity"))
  system "rm #{File.join(SSH_PATH, "heroku.identity")} && ln -s #{File.join(SSH_PATH, "#{ACCOUNT_IDENTITY}.identity")} #{File.join(SSH_PATH, "heroku.identity")}"
  system "rm #{File.join(SSH_PATH, "heroku.identity.pub")} && ln -s #{File.join(SSH_PATH, "#{ACCOUNT_IDENTITY}.identity.pub")} #{File.join(SSH_PATH, "heroku.identity.pub")}"
end
