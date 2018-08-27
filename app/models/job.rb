class Job < ApplicationRecord
  belongs_to :category, optional:true
  belongs_to :company
  validates :title, :level_of_interest, :city, presence: true
end
