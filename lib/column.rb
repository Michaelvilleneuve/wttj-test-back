class Column
  attr_accessor :name, :applications

  def initialize(name)
    @name = name
    @applications = []
  end

  def <<(application)
    application.move_to(self)
    @applications << application unless @applications.include?(application)
    application
  end

  def remove(application_to_delete)
    @applications.delete_if { |a| a == application_to_delete }
  end

  def size
    @applications.size
  end
end