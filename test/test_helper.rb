require 'rubygems'

require 'active_support'
if ActiveSupport::VERSION::STRING >= '4.1.0'
  require 'minitest'
  require 'minitest/autorun'
else
  require 'test/unit'
end

ENV["RAILS_ENV"] = "test"

require 'action_pack'
require 'action_controller'
require File.expand_path('../../lib/rails/render_hooks', __FILE__)

