class Category < ApplicationRecord
    include Hashid::Rails
    validates :category_name,:user_id, presence: true, uniqueness: true
    validates :description, presence: true
    
    
    has_many :entries
    before_destroy :reset_entries_category_id
    belongs_to :user


    def reset_entries_category_id
        self.entries.update_all(category_id: 0)
    end

    
end
