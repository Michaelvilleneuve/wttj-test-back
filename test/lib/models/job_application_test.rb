require_relative '../../test_helper'
require_relative '../../../lib/models/job_application'

class JobApplicationTest < TestHelper
  setup do
    @user = User.new('Michael')
    @job = JobOffer.new('Stage - Account Manager')
    @application = JobApplication.new(@user, @job)
  end

  test 'can create an application between a job and a user' do
    assert_equal @user, @application.user
    assert_equal @job, @application.job
  end

  test 'move_to allows to move a job_application from one column to another' do
    assert_nil @application.column
    @application.move_to(Column.new('To be fired'))
    
    assert_equal 'To be fired', @application.column.name
  end
    

  test 'move_to removes application from previous column' do
    @application.move_to(old_column = Column.new('To be fired'))
    @application.move_to(Column.new('To be engaged'))
    assert_not old_column.applications.include?(@application)
  end
end
