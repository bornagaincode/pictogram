class UploadsController < ApplicationController
  def index
    @new_upload = Upload.new
    @upload = Upload.last
  end

  def create
    upload = Upload.create(upload_params)

    redirect_to root_path
  end

  private

  def upload_params
    params.require(:upload).permit(:image)
  end
end
