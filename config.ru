require 'irkit'
require 'rack'
require 'sinatra'

require 'logger'
$logger = Logger.new $stdout
if development?
  $stdout.sync = true
  $logger.level = Logger::INFO
  require 'sinatra/reloader'
elsif production?
  $logger.level = Logger::WARN
end

require 'sinatra/content_for'
require 'haml'
require 'sass'
require 'json'

require_relative 'helpers/helper'
require_relative 'controllers/main'

set :haml, :escape_html => true

run Sinatra::Application
