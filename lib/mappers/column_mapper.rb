require_relative 'job_application_mapper'

module Mappers
  class ColumnMapper < ActiveMappers::Base
    attributes :name, :size
    relation :applications, ::Mappers::JobApplicationMapper
  end
end