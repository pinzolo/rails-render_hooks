require "rails/render_hooks/version"

module RenderHooks
  extend ActiveSupport::Concern

  included do
    define_callbacks :process_render
    alias_method_chain :render, :render_hooks
  end

  def render_with_render_hooks(*options, &block)
    if ActiveSupport::VERSION::STRING >= '4.0.0'
      run_callbacks(:process_render) do
        render_without_render_hooks(*options, &block)
      end
    else
      run_callbacks(:process_render, action_name) do
        render_without_render_hooks(*options, &block)
      end
    end
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
