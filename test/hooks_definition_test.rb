require 'test_helper'

TestClass = defined?(Test) ? Test::Unit::TestCase : MiniTest::Test

class BeforeRenderTest < TestClass

  def test_before_render
    assert ActionController::Base.respond_to?(:before_render)
  end

  def test_append_before_render
    assert ActionController::Base.respond_to?(:append_before_render)
  end

  def test_skip_before_render
    assert ActionController::Base.respond_to?(:skip_before_render)
  end

  def test_prepend_before_render
    assert ActionController::Base.respond_to?(:prepend_before_render)
  end

  def test_after_render
    assert ActionController::Base.respond_to?(:after_render)
  end

  def test_append_after_render
    assert ActionController::Base.respond_to?(:append_after_render)
  end

  def test_skip_after_render
    assert ActionController::Base.respond_to?(:skip_after_render)
  end

  def test_prepend_after_render
    assert ActionController::Base.respond_to?(:prepend_after_render)
  end

  def test_around_render
    assert ActionController::Base.respond_to?(:around_render)
  end

  def test_append_around_render
    assert ActionController::Base.respond_to?(:append_around_render)
  end

  def test_skip_around_render
    assert ActionController::Base.respond_to?(:skip_around_render)
  end

  def test_prepend_around_render
    assert ActionController::Base.respond_to?(:prepend_around_render)
  end
end
