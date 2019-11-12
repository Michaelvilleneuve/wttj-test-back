module Mappers
  class ColumnMapper < ActiveMappers::Base
    attributes :name, :size
    relation :applications, ::Mappers::JobApplicationMapper
  end
end