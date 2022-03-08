require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @category = Category.create(name: "aagfg")
  end

  test "to get categories" do
    get categories_path
    assert_response :success
  end

  test "to new category" do
    get new_category_path
    assert_response :success
  end

  # test "should create new user" do
  #   post "/categories", params: { category: { } }
  #   assert_response(:success, message = "failed to create user")
  # end

  test "to create category" do

    assert_difference("Category.count", 1) do
      post categories_path, params: { category: { name: "abcde" } }
    end

    assert_redirected_to categories_path
  end

  # test "to check show category" do
  #   @category.save
  #    get category_url(@category)
  #    assert_response :success
  # end
  
  # test "edit category" do
  #   @category.save
  #   put category_url(@category), params: {category: {name: "rahul"} }
    
  #   assert_redirected_to categories_path
  # end

end
