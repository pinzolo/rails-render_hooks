require 'test_helper'

class SampleController < ActionController::Base
  include RenderHooks

  before_action :exec_before_action
  after_action :exec_after_action
  around_action :exec_around_action
  prepend_before_render :exec_prepend_before_render
  before_render :exec_before_render, except: [:new]
  skip_before_render :exec_before_render, only: [:show]
  prepend_after_render :exec_prepend_after_render
  after_render :exec_after_render, except: [:new]
  skip_after_render :exec_after_render, only: [:show]
  prepend_around_render :exec_prepend_around_render
  around_render :exec_around_render, except: [:new]
  skip_around_render :exec_around_render, only: [:show]

  attr_accessor :footmarks

  [:index, :new, :show].each do |action|
    define_method(action) { render text: '' }
  end

  def reset
    @footmarks = []
  end

  private
  [:action, :render].each do |type|
    [:before, :after].each do |callback|
      define_method(:"exec_#{callback}_#{type}") do
        @footmarks << "exec_#{callback}_#{type}"
      end
      define_method(:"exec_prepend_#{callback}_#{type}") do
        @footmarks << "exec_prepend_#{callback}_#{type}"
      end
    end
  end

  def exec_around_action
    @footmarks << "exec_around_action_1"
    yield
    @footmarks << "exec_around_action_2"
  end

  def exec_around_render
    @footmarks << "exec_around_render_1"
    yield
    @footmarks << "exec_around_render_2"
  end

  def exec_prepend_around_render
    @footmarks << "exec_prepend_around_render_1"
    yield
    @footmarks << "exec_prepend_around_render_2"
  end
end

class SampleControllerTest < ActionController::TestCase
  setup do
    @controller.reset
  end

  def test_in_place
    exec_action(:index)
    assert_equal @controller.footmarks, ["exec_before_action",
                                         "exec_around_action_1",
                                         "exec_prepend_around_render_1",
                                         "exec_prepend_before_render",
                                         "exec_before_render",
                                         "exec_around_render_1",
                                         "exec_around_render_2",
                                         "exec_after_render",
                                         "exec_prepend_after_render",
                                         "exec_prepend_around_render_2",
                                         "exec_around_action_2",
                                         "exec_after_action"]
  end

  def test_with_except_option
    exec_action(:new)
    assert_equal @controller.footmarks, ["exec_before_action",
                                         "exec_around_action_1",
                                         "exec_prepend_around_render_1",
                                         "exec_prepend_before_render",
                                         "exec_prepend_after_render",
                                         "exec_prepend_around_render_2",
                                         "exec_around_action_2",
                                         "exec_after_action"]
  end

  def test_skip
    exec_action(:show)
    assert_equal @controller.footmarks, ["exec_before_action",
                                         "exec_around_action_1",
                                         "exec_prepend_around_render_1",
                                         "exec_prepend_before_render",
                                         "exec_prepend_after_render",
                                         "exec_prepend_around_render_2",
                                         "exec_around_action_2",
                                         "exec_after_action"]
  end
  private

  def exec_action(action)
    with_routing do |set|
      set.draw do
        get ':controller(/:action)'
      end
      process action
    end
  end
end
