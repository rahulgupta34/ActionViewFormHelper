require "test_helper"

class ListingCategoryTest < ActionDispatch::IntegrationTest
  def setup
     @category = Category.create(name: "ghdy")
     @category2 = Category.create(name:"gjjsd")
  end

    #integration testing for listing categories
  test "integration testing for index action" do 
    get categories_path
     assert_select "a[href=?]", category_path(@category), text: @category.name
    #  assert_select "a[href=?]", category_path(@category2), text: @category.name
  end

end
