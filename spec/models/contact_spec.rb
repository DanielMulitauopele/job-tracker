require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "Staff", email: "Bill@gmail.com")
        expect(contact).to be_invalid
      end
      it "is invalid without a position" do
        contact = Contact.new(name: "Billy Bills", email: "Bill@gmail.com")
        expect(contact).to be_invalid
      end
      it "is invalid without a email" do
        contact = Contact.new(name: "Billy Bills", position: "Staff")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        contact = Contact.new(name: "Billy Bills", position: "Staff", email: "Bill@gmail.com", company: company)
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = Contact.new(name: "Billy Bills", position: "Staff", email: "Bill@gmail.com")
      expect(contact).to respond_to(:company)
    end
  end
end
