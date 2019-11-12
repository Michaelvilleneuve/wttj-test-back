module Mappers
  class ColumnMapper < ActiveMappers::Base
    attributes :name
    relation :applications, ::Mappers::JobApplicationMapper
  end
end