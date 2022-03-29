ActiveAdmin.register Post do
  menu parent: "Blog"
  
  breadcrumb do
    ['admin','Blog','Post']
  end
 
  permit_params :title, :body, :picture, :per_page
  
  index do
    selectable_column
    id_column
    column :title
    column :body
    column :picture do |profile|
      if !profile.picture.file.nil?
        image_tag(profile.picture.url, size: "100x100")
      end
    end
    
    actions
  end

  # before_action only: :index do
  #   unless params[:per_page]
      
  #     @per_page = 30
  #   end
  # end

  config.per_page = [1,10, 20, 30, 50, 75, 100]

  # show do 
  #   attributes_table do
  #     row :title
  #     row :body
  #     row :picture do |image_profile|
  #       image_tag(image_profile.picture.url, size: "100x100")
  #     end
  #   end
  # end

  show do 
    render "show", { post_show: post }
    default_main_content
  end

  sidebar "Post Details", only: :show do
    attributes_table_for post do
      row :title
      row :body
      row :created_at
    end
  end

  filter :title, filters: [:starts_with]
  filter :body
 
  form partial: "form", title: "Add New Post"
  # form multipart: true, title: "Create New Post" do |f|
  #   f.inputs do
  #     f.input :title, label: "Enter Your Title"
  #     f.input :body, label: "Enter Your body"
  #     f.file_field :picture
      
  #   end

  #   panel 'Note*' do
  #     "All Fields Are Mandatory."
  #   end

  #   f.actions
  # end
end
