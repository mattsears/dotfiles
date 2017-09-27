#!/usr/bin/ruby
require 'rubygems'
require 'rubygems' unless defined? Gem # rubygems is only needed in 1.8

require 'irb/completion'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT][:CUSTOM] = "%N(%m):%03n:%i %~> ".tap {|s| def s.dup; gsub('%~', Dir.pwd); end }

IRB::Irb.class_eval do
  def output_value
    if defined? AwesomePrint
      ap @context.last_value
    else
      p @context.last_value
    end
  end
end


# begin
#   require 'wirble'
#   Wirble.init
#   Wirble.colorize
# rescue LoadError => err
# end

# begin
#   require 'hirb'
#   Hirb.enable :output => {"ActiveRecord::Base" => {:class => :auto_table, :ancestor => true, :options => {:vertical => true}}}
# rescue LoadError => err
#   warn "Couldn't load Hirb : #{err}"
# end

require "ap" unless defined? AwesomePrint
if defined? AwesomePrint
  # AwesomePrint.irb!
  AwesomePrint.pry!
end

class Object

  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  def my_methods
    base_object = case self
                  when Class  then Class.new
                  when Module then Module.new
                  else             Object.new
                  end
    (methods - base_object.methods).sort
  end

  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end

  # Return only the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.new.methods).sort
  end

end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def paste
  `pbpaste`
end

alias q exit

if(defined? ActiveRecord) then
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
