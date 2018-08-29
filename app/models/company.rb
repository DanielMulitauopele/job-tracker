class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_companies
    Company.find_each do |company|
      require "pry"; binding.pry
      company.jobs.average(:level_of_interest)
    end
  end
end
