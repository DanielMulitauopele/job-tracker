class DashboardController < ApplicationController
  def index
    @counted_interest = Job.level_of_interest_count
  end
end
