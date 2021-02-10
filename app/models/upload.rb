class Upload < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_one_attached :image

  validates :image, attached: true, content_type: /\Aimage\/.*\z/

  def exif
    return {} unless image.image?

    {
      camera: camera_name,
      lens: image.metadata[:lens_model],
      focal_length: image.metadata[:focal_length],
      exposure_time: image.metadata[:exposure_time],
      shutter_speed: image.metadata[:shutter_speed_value],
      aperture: image.metadata[:aperture_value],
      iso: image.metadata[:iso_speed_ratings]
    }.compact
  end

  private

  def camera_name
    return nil unless image.metadata[:make]
    return image.metadata[:make] unless image.metadata[:model]

    "#{image.metadata[:make]} #{image.metadata[:model]}"
  end
end
