require_relative 'column_mapper'

module Mappers
  class JobOfferMapper < ActiveMappers::Base
    attributes :name
    relation :columns, ::Mappers::ColumnMapper
  end
end