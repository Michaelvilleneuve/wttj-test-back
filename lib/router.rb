require 'active_support/inflector'
require 'active_support/core_ext/hash/indifferent_access'

class Router
  def initialize(request)
    @request = request.with_indifferent_access
  end

  def handle
    handler.new(@request).send(@request[:action])
  rescue => e
    p 'Unable to process request'
  end

  def handler
    "Controllers::#{@request[:controller].pluralize.camelize}Controller".constantize
  end
end