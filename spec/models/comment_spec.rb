require 'rails_helper'

describe Comment, type: :model do
  describe "validations" do
      it {should validate_presence_of(:content)}
    end

  describe "relationships" do
       it { should belong_to :job }
  end
  #   company = Company.create(name: "Space People")
  #   job = company.jobs.create(title: "Astronaut", city: "Mars", level_of_interest: 300, description: "SPACE")
  #   comment = job.comments.create(content: 'You can bring your dog to space')
  #
  #   expect(comment).to respond_to(:job)
  # end
 end
