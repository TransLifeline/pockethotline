require 'rails_helper'

RSpec.describe UsersHelper, :type => :helper do
  describe "secure_password?" do
    it "should be true for secure passwords" do
      expect(helper.secure_password?("password1!")).to eq(true)
    end

    it "should be false for insecure passwords" do
      # Too short
      expect(helper::secure_password?("pass1!")).to eq(false)

      # Missing special character
      expect(helper::secure_password?("password1")).to eq(false)

      # Missing number
      expect(helper::secure_password?("password!")).to eq(false)
    end
  end
end
