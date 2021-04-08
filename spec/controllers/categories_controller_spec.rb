require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

    login_user

    
    let(:valid_attributes) {
        { :user_id => 1, :category_name => "Test Category Name!", :description => "This is a test description"}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Category.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful, "HTTP Response returned 200"
        end
    end

end