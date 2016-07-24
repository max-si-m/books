class Genre < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:finders, :slugged, :history]

  default_scope -> { order(id: :desc) }
  validates :title, presence: true

  has_and_belongs_to_many :books

  def should_generate_new_friendly_id?
   title_changed?
  end
end
