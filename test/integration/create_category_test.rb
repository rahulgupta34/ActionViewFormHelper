require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name:"Admin")
  end
  # this is the integration testing 
  test "to get the new category and create it" do
      get new_category_path
      assert_response :success

      assert_difference "Category.count", 1 do
        post categories_path, params: { category: {name: "admin"} }
      end
      assert_redirected_to categories_path
  end

  #we are making this test case for invalid category creation 
  test "to get the new category form and invalid category" do 
   
    get new_category_path
    assert_response :success

    assert_no_difference "Category.count" do
       post categories_path, params: { category: {name: " "} }
    end

  assert_match "Create", response.body
    # assert_select "h1.alert"  this match the rendering template word or classes in this scenario it will mtach with new.html.erb template
  end

  
  #integration testing for show action 
  test "integratio testing for show action " do 
    # @category.save
    get categories_path(@category)
    assert_response :success
  end
end
