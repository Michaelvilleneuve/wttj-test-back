require_relative 'user_mapper'

module Mappers
  class JobApplicationMapper < ActiveMappers::Base
    relation :user, ::Mappers::UserMapper
  end
end