class DashboardController < ApplicationController
  def index
    @counted_interest = Job.level_of_interest_count
    @top_three = Company.top_three_companies
    # @location_count = Job.location_job_count
  end
end
