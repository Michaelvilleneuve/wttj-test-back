class JobApplication
  attr_reader :user, :job, :column

  def initialize(user, job)
    @user = user
    @job = job
    @column = nil
  end

  def move_to(column)
    @column.remove(self) unless @column.nil?
    @column = column
  end
end