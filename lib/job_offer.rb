class JobOffer
  attr_reader :name, :columns

  def initialize(name)
    @name = name
    @columns = [
      Column.new('À rencontrer'),
      Column.new('Entretien')
    ]
  end

  def apply(user)
    @columns[0] << JobApplication.new(user, self)
  end

  def applications
    @columns.map(&:applications).flatten
  end

  def applications_in(column_name)
    column = @columns.find { |column| column.name === column_name }
    column&.applications || []
  end

  def render
    Mappers::JobOfferMapper.with(self, rootless: true).to_json
  end
end