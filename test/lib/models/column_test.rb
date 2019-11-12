require_relative '../../test_helper'

class ColumnTest < TestHelper
  setup do
    @column = Column.new('Pending')
    @user = User.new('Michael')
    @job = JobOffer.new('Stage - Account Manager')

    @application = JobApplication.new(@user, @job)
  end

  test 'column has a name' do
    assert_equal 'Pending', @column.name
  end

  test 'columns can be filled with applications' do
    @column.insert(@application)
    
    assert @column.applications.include?(@application)
  end
    
  test 'insert is idempotent' do
    assert_equal 0, @column.applications.size
    @column.insert(@application)
    assert_equal 1, @column.applications.size
    @column.insert(@application)
    assert_equal 1, @column.applications.size
  end

  test 'insert can reorder the applications list based on index' do
    user2 = User.new('Marie')
    user3 = User.new('Theo')

    application2 = JobApplication.new(user2, @job)
    application3 = JobApplication.new(user3, @job)

    @column.insert(@application)
    @column.insert(application2)
    @column.insert(application3, 1)

    assert_equal 'Theo', @column.applications[1].user.first_name
  end

  test 'adding an application to a column moves it to the right status' do
    @column.insert(@application)

    assert @column.applications.include?(@application)
  end

  test 'size indicates column size' do
    column = Column.new('Pending')
    assert_equal 0, column.size

    column.insert(@application)
    assert_equal 1, column.size
  end

  test 'remove removes an element from a column' do
    @column.insert(@application)

    @column.remove(@application)
    assert_not @column.applications.include?(@application)
  end
end
