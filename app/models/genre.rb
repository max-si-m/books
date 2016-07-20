class Genre < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:finders, :slugged]

  validates :title, presence: true

  has_and_belongs_to_many :books
end
