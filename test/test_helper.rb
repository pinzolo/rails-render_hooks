require "coveralls"
require "simplecov"
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter '/test/'
  add_filter '/bundle/'
end

require "active_support/version"
if ActiveSupport::VERSION::STRING >= '4.1.0'
  require 'minitest'
  require 'minitest/autorun'
else
  require 'test/unit'
end

ENV["RAILS_ENV"] = "test"

require File.expand_path('../../lib/rails/render_hooks', __FILE__)

