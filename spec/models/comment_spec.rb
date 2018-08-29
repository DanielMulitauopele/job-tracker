require 'rails_helper'

describe Comment, type: :model do
  describe "validations" do
      it {should validate_presence_of(:content)}
    end
  end


    # describe 'relationships' do
    #   it { should belong_to :job }
    # end
