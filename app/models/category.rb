class Category < ApplicationRecord
    include Hashid::Rails

    validates :user_id,:description, presence: true
    validates :category_name, presence: true
    validates :category_name, uniqueness: true
    
    has_many :entries
    before_destroy :reset_entries_category_id
    belongs_to :user

    def reset_entries_category_id
        self.entries.update_all(category_id: 0)
    end

    
end
