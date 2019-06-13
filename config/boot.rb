# frozen_string_literal: true

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'rubygems'
require 'bundler/setup'
require 'active_support/all'

require_relative './app'

Bundler.require :default, App.env

Dir.mkdir('log') unless File.directory?('log')

Dir[File.expand_path('../config/initializers/*.rb', __dir__)].each do |initializer|
  require initializer
end

class MyInflector < Zeitwerk::Inflector
  def camelize(basename, _abspath)
    case basename
    when 'api' then 'API'
    else super
    end
  end
end

loader = Zeitwerk::Loader.new
loader.inflector = MyInflector.new

loader.push_dir(App.root.join('app'))
loader.push_dir(App.root.join('app', 'models'))
loader.push_dir(App.root.join('app', 'services'))
loader.push_dir(App.root.join('lib'))

loader.preload(App.root.join('app', 'api', 'validators'))

loader.enable_reloading
loader.setup

loader.eager_load
