class UploadsController < ApplicationController
  def index
    @new_upload = Upload.new
    @uploads = Upload.all
  end

  def create
    upload = Upload.new(upload_params)

    if upload.save
      redirect_to root_path
    else
      redirect_to root_path, flash: { error: upload.errors.full_messages[0] }
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:image, :text)
  end
end
