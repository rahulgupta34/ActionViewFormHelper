# frozen_string_literal: true
ActiveAdmin.register_page "Calender" do
  content do
   para "Welcome to active admin."
   h3 "Learn Adtive Admin In Depth."
   render "calender"
   
  end

  sidebar "Help Contact" do
    para "Need help? Email us at help@example.com"
    ul do
      li "First list here whatever you want"
      li "Second list here etc "
    end
  end

end
