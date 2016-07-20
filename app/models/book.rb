class Book < ApplicationRecord
  validates :title, :author, presence: true
  validates :logo, format: { with: /\Ahttps?:\/\/.*\.(?:jpe?g|png)\z/,
    message: 'can be only image URL in jpeg or png format'  }

  belongs_to :user
end
