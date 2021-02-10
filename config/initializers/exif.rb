require 'exifr/jpeg'

module ActiveStorage
  class Analyzer::ImageAnalyzer < Analyzer
    def metadata
      read_image do |image|
        dimensions(image).merge(extract_exif_data(image))
      end
    rescue LoadError
      logger.info "Skipping image analysis because the mini_magick gem isn't installed"
      {}
    end

    private

    def extract_exif_data(image)
      return unless image.type == 'JPEG'

      EXIFR::JPEG.new(image.path) || {}
    rescue EXIFR::MalformedImage, EXIFR::MalformedJPEG
      logger.info "Skipping image analysis because of a malformed image file"
      {}
    end

    def dimensions(image)
      rotated_image?(image) ? { width: image.height, height: image.width } :
        { width: image.width, height: image.height }
    end
  end
end
