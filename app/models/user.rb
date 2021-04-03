class User < ApplicationRecord
  include Hashid::Rails
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :capitalize_names
  mount_uploader :picture, PictureUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :entries
         has_many :categories

         def capitalize_names
          self.firstname = firstname.capitalize
          self.lastname = lastname.capitalize
        end    
end
