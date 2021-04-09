require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    login_user

    let(:valid_attributes) {
        { :id => 2,:user_id => 1, :category_name => "Test Category Name!", :description => "This is a test description"}
    }

    let(:valid_session) { {} }

    describe "GET welcome page" do
        it "returns a success response" do
            Category.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful
        end
    end

end