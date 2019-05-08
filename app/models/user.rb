class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :avatar,
                    styles: {
                        thumb: ["300x300"],
                        medium: ["100x100"],
                        small: ["30x30"]
                    },
                    convert_options: {
                        thumb: "-quality 70 -strip",
                        original: "-quality 90"
                    }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/ 
end
