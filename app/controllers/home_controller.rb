class HomeController < ApplicationController
  
  def index
    TestingJob.set(wait: 1.week).perform_later
    TestingJob.perform_now("hi")
    TestingJob.set(wait_until: Date.tomorrow.noon).perform_later("guest")
    ExampleJob.set(wait_until: 2.months).perform_later "this should be run after 2 month "
    ExampleJob.perform_later
  end

  def show
    
  end

end
