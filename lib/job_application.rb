class JobApplication
  attr_reader :user, :job, :column

  def initialize(user, job)
    @user = user
    @job = job
  end

  def move_to(column)
    @column = column
  end
end