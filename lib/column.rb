class Column
  attr_accessor :name, :applications

  def initialize(name)
    @name = name
    @applications = []
  end

  def <<(application)
    @applications << application unless @applications.include?(application)
    application.move_to(self)
  end

  def size
    @applications.size
  end
end