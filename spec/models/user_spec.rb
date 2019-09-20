require 'rails_helper'

RSpec.describe User, type: :model do
  user=User.create(name: "fatima", email: "fatima@g.gmail")
  context "valid User" do
    it "has a valid email" do
      expect(user).to be_valid
    end
    it "has a valid name" do
      expect(user).to be_valid
    end
  end
end
