class TestingJob < ApplicationJob
  queue_as :default
  queue_as :low_priority


  def perform(*args)
    p 'hello from testing job'
  end
end
