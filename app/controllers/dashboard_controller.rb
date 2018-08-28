class DashboardController < ApplicationController
  def index
    @counted_interest = Dashboard.level_of_interest_count
    @top_three = Dashboard.top_three_companies
    @location_count = Dashboard.location_job_count
  end
end
