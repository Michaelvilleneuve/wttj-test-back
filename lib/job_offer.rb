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
    @columns[0] << application = JobApplication.new(user, self)
    application
  end

  def applications
    @columns.map(&:applications).flatten
  end

  def applications_in(column_name)
    column = @columns.find { |column| column.name === column_name }
    column&.applications || []
  end
end