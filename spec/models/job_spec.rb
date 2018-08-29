require 'rails_helper'
require 'date'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company: company)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo")
      expect(job).to respond_to(:company)
    end
  end
  describe "#instance methods" do
    it "sorts by descending order" do
      company = Company.create!(name: "ESPN")
      date = DateTime.new(2017,2,3,4,5,6)
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      job.comments.create(content: "Maybe Not.", created_at:date, updated_at:date)
      comment_2 = job.comments.create(content: "Help.")
      first_comment = job.sort_comments.first

      expect(first_comment).to eq(comment_2)

    end
  end
end
