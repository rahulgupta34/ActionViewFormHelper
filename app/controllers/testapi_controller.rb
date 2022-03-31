class TestapiController < ApplicationController
  
  require "rest-client"

  def index
    url = "https://jsonplaceholder.typicode.com/posts"
    response = RestClient.get(url)
    @result = JSON.parse(response)
  end

  def show
    url = "https://jsonplaceholder.typicode.com/posts/#{params[:id]}"
    response = RestClient.get(url)
    @result = JSON.parse(response)
  end

  def comments
    url = "https://jsonplaceholder.typicode.com/posts/#{params[:id]}/comments"
    response = RestClient.get(url)
    @result = JSON.parse(response)
  end

end
