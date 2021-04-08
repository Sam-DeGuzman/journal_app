require 'rails_helper'

RSpec.describe EntriesController, type: :controller do

    login_user
    
    let(:valid_attributes) {
        { :category_id => 1, :user_id => 1, :title => "Test Entry Title!", :content => "This is a test content",:deadline => Date.today}
    }

    let(:valid_session) { {} }

    describe "GET #index" do
        it "returns a success response" do
            Entry.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful, "HTTP Response returned 200"
        end
    end

end