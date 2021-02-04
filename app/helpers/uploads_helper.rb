module UploadsHelper
  def render_image(upload)
    image_tag upload.image.representation(resize_to_limit: [500, 500])
  end
end
