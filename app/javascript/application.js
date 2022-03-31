// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require datatables
//= require jquery_ujs


import "@hotwired/turbo-rails"
import "controllers"

$(document).on('turbolinks:load', function(){
    $("table[role='datatable']").each(function(){
      $(this).DataTable({
        processing: true,
        serverSide: true,
        ajax: $(this).data('url')
      });
    });  
  })