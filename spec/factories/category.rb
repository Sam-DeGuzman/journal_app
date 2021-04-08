FactoryBot.define do
    factory :category do
      id {1}
      user_id {1}
      category_name {"Sample Category Name"}
      description {"Sample Category Description"}
      
      # Add additional fields as required via your User model
    end
  
  end