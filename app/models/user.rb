class User < ApplicationRecord
  include Hashid::Rails
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :firstname, :lastname, presence: true

  before_save :capitalize_names

  mount_uploader :picture, PictureUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :entries ,dependent: :destroy_async
         has_many :categories, dependent: :destroy_async


         def capitalize_names
          self.firstname = firstname.capitalize
          self.lastname = lastname.capitalize
        end  

end
