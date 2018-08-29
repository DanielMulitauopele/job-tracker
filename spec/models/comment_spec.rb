require 'rails_helper'

describe Comment, type: :model do
  describe "validations" do
      it {should validate_presence_of(:content)}
    end
  end

describe "relationships" do
  it "belongs to a job" do
    job = Job.create(title: "Astronaut", city: "Mars", company_id: 1, level_of_interest: 300, description: "SPACE")
    comment = Comment.create(content: 'You can bring your dog to space', job_id: job.id)

    expect(comment).to respond_to(:job)
  end
 end
