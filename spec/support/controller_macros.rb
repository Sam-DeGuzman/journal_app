module ControllerMacros
  def login_user
    before(:each) do

      # Creates User and Category
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      category = FactoryBot.create(:category)
      sign_in user
    end
  end

end