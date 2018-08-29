class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def sort_contacts
    contacts.order(name: :asc)
  end  
end
