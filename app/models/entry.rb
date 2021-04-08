class Entry < ApplicationRecord
    include Hashid::Rails
    validates :category_id, :user_id,:title,:content,:deadline, presence: true 
    validates :entry_stat, inclusion: { in: ['To-do', 'Doing', 'Done']}
    
    belongs_to :user
    belongs_to :category

    has_rich_text :content
    mount_uploader :cover_image, PictureUploader

    ENTRY_STAT = [
        [ 'To-do'], ['Doing'], ['Done']].freeze
        
end
