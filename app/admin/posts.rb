ActiveAdmin.register Post do
  menu parent: "Blog"
 
  permit_params :title, :body, :picture
  
  # permit_params do
  #   permitted = [:title, :body]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  

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
    end
  end

  filter :title, filters: [:starts_with]
  filter :body
 
  form multipart: true do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.file_field :picture
      
    end
    f.actions
  end
end
