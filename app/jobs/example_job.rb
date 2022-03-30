class ExampleJob < ApplicationJob
  queue_as :high

  def perform(*args)
    puts "==================="
    puts "this is will run in a week."
    puts "==================="
  end
end
