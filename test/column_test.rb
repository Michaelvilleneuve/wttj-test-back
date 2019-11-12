require_relative 'test_helper'
require_relative '../lib/column'

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
    @column << @application
    
    assert @column.applications.include?(@application)
  end
    
  test '<< is idempotent' do
    assert_equal 0, @column.applications.size
    @column << @application
    assert_equal 1, @column.applications.size
    @column << @application
    assert_equal 1, @column.applications.size
  end

  test 'adding an application to a column moves it to the right status' do
    @column << @application

    assert @column.applications.include?(@application)
  end

  test 'size indicates column size' do
    column = Column.new('Pending')
    assert_equal 0, column.size

    column << @application
    assert_equal 1, column.size
  end

  test 'remove removes an element from a column' do
    @column << @application

    @column.remove(@application)
    assert_not @column.applications.include?(@application)
  end
end
