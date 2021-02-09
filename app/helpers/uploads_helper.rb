module UploadsHelper
  def render_image(upload, options = {})
    image_tag upload.image.representation(resize_to_limit: [1200, 1200]), options
  end
end
