require 'rails_helper'

RSpec.describe Event, type: :model do
  before :each do
    @user=User.new(name: "example", email: "example@user.com")
    @event=@user.events.new(description: "Microverse assembly", date: Date.now, location: "zoom")
  end
end



# RSpec.describe User, type: :model do
#   before :each do
#     @user=User.new(name: "fatima", email: "fatima@g.gmail")
#   end 
#   context "valid User" do
#     it "has a valid email" do
#       expect(@user).to be_valid
#     end
#     it "has a valid name" do
#       expect(@user).to be_valid
#     end
#   end

#   context "invalid User" do
#     it "has a invalid email" do
#       @user.email=" "
#       expect(@user).to_not be_valid
#     end
#     it "has a valid name" do
#       @user.name="  "
#       expect(@user).to_not be_valid
#     end
#   end

# end