require 'rails_helper'

describe Dashboard do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Dashboard.new(level_of_interest: 80, description: "Wahoo", city: "Denver")
        expect(job).to be_invalid
      end
    end
  end

  describe "class methods" do
    it "count jobs by level of interest" do
      job = Dashboard.new(title: "Software", level_of_interest: 70, description: "Wahooo")

      
    end
  end
end
