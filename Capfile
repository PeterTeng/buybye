require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/sidekiq'
require 'capistrano/rails'
require "whenever/capistrano"
require 'capistrano/sitemap_generator'

require './lib/base'
Dir.glob('lib/*.cap').each { |r| import r }
Dir.glob('lib/caps/*.cap').each { |r| import r }

require 'pry'
