class Job < ApplicationRecord
  belongs_to :category, optional:true
  belongs_to :company
  validates :title, :level_of_interest, :city, presence: true

  def self.level_of_interest_count
    group(:level_of_interest).order(level_of_interest: :desc).count
  end
end
