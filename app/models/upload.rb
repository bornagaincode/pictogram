class Upload < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_one_attached :image

  validates :image, attached: true, content_type: /\Aimage\/.*\z/
end
