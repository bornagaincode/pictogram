class Upload < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_one_attached :image
end
