require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.new(name:"news")
  end

 
  test "name should be present" do
    @category.name = "news"
    assert @category.valid?
  end

  test "category should be unique" do
    @category.save
    @category1 = Category.new(name:"news")
    assert_not @category1.valid?
  end

  test "length should be mimimum 3 character" do 
    @category.name = "ss"
    assert_not @category.valid?
  end

  test "length should be maximum 5 character" do 
    @category.name = "sssdgb"
    assert_not @category.valid?
  end

end
