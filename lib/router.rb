require 'active_support/inflector'

class Router
  def initialize(request)
    @request = request
  end

  def handle
    handler.new(@request).send(@request[:action])
  rescue
    raise 'Unable to process request'
  end

  def handler
    "Controllers::#{@request[:controller].pluralize.camelize}Controller".constantize
  end
end