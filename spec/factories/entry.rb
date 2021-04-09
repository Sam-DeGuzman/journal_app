FactoryBot.define do
    factory :entry do
      category_id {1} 
      user_id {1}
      title {"Test Entry Title!"}
      content {"This is a test content"}
      deadline {Date.today}   
    end
  
  end