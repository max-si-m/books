class Book < ApplicationRecord
  extend FriendlyId
  include AASM

  friendly_id :slug_candidates, use: [:finders, :slugged]

  aasm do
    state :publish, initial: true
    state :draft

    event :publishing do
      transitions from: :draft, to: :publish
    end

    event :drafting do
      transitions from: :publish, to: :draft
    end
  end

  validates :title, :author, presence: true
  validates :logo, format: { with: /\Ahttps?:\/\/.*\.(?:jpe?g|png|gif)\z/,
    message: 'can be only image URL in jpeg, gif or png format'  }

  belongs_to :user
  has_and_belongs_to_many :genres

  scope :recents, -> { where('created_at >= ?', 1.week.ago) }
  default_scope -> { order(id: :desc) }

  private

  def slug_candidates
    [
      :title,
      [:title, :author]
    ]
  end
end
