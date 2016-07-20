class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: [:finders, :slugged]

  validates :title, :author, presence: true
  validates :logo, format: { with: /\Ahttps?:\/\/.*\.(?:jpe?g|png)\z/,
    message: 'can be only image URL in jpeg or png format'  }

  belongs_to :user

  def slug_candidates
    [
      :title,
      [:title, :author]
    ]
  end
end
