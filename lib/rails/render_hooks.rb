require "rails/render_hooks/version"
require "active_support/concern"
require "action_controller"

module RenderHooks
  extend ActiveSupport::Concern

  module Renderer
    def render(*options, &block)
      run_callbacks(:process_render) do
        super(*options, &block)
      end
    end
  end

  included do
    define_callbacks :process_render
    prepend Renderer
  end

  module ClassMethods
    [:before, :after, :around].each do |callback|
      define_method "#{callback}_render" do |*names, &block|
        _insert_callbacks(names, block) do |name, options|
          set_callback(:process_render, callback, name, options)
        end
      end
      alias_method :"append_#{callback}_render", :"#{callback}_render"

      define_method "prepend_#{callback}_render" do |*names, &block|
        _insert_callbacks(names, block) do |name, options|
          set_callback(:process_render, callback, name, options.merge(:prepend => true))
        end
      end

      define_method "skip_#{callback}_render" do |*names, &block|
        _insert_callbacks(names, block) do |name, options|
          skip_callback(:process_render, callback, name, options)
        end
      end
    end
  end
end

ActionController::Base.__send__(:include, RenderHooks)
