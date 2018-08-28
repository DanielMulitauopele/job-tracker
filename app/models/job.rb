class Job < ApplicationRecord
  belongs_to :category, optional:true
  belongs_to :company
  validates :title, :level_of_interest, :city, presence: true

  def self.level_of_interest_count
    # require "pry"; binding.pry
    group(:level_of_interest).order(level_of_interest: :desc).count
    # Job.where(level_of_interest: (job.level_of_interest)).count
  end
end
