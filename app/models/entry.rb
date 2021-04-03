class Entry < ApplicationRecord
    include Hashid::Rails
    validates :title,:content,:deadline, presence: true 
    belongs_to :user
    belongs_to :category

    has_rich_text :content
    mount_uploader :cover_image, PictureUploader
end
