class Column
  attr_accessor :name, :applications

  def initialize(name)
    @name = name
    @applications = []
  end

  def insert(application, index = 0)
    application.move_to(self)
    @applications.insert(index, application) unless @applications.include?(application)
    application
  end

  def remove(application_to_delete)
    @applications.delete_if { |a| a == application_to_delete }
  end

  def size
    @applications.size
  end
end