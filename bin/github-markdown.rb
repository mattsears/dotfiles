#!/Users/matt/.rbenv/versions/2.0.0-p0/bin/ruby
#
# Githib flavored markdown with syntax highlighting
#
# Usage: github-markdown [<file>...]
#
# Convert one or more Markdown files to HTML and write to standard output. With
# no <file> or when <file> is '-', read Markdown source text from standard input.
#

require 'albino'
require 'redcarpet'
require 'nokogiri'

if ARGV.include?('--help')
  File.read(__FILE__).split("\n").grep(/^# /).each do |line|
    puts line[2..-1]
  end
  exit 0
end

# create a custom renderer that allows highlighting of code blocks
class HTMLwithAlbino < Redcarpet::Render::HTML
  def block_code(code, language)
    Albino.colorize(code, language) rescue nil
  end
end

markdown = Redcarpet::Markdown.new(HTMLwithAlbino,
  :fenced_code_blocks => true,
  :tables             => true,
  :strikethrough      => true,
  :gh_blockcode       => true)

puts markdown.render(ARGF.read)
