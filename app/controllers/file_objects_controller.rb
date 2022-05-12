class FileObjectsController < ApplicationController
  before_action :required_login!
  before_action :check_params!

  def create
    blob = ActiveStorage::Blob.create_and_upload!(io:           File.open(params[:file].tempfile),
                                                  filename:     params[:file].original_filename,
                                                  content_type: params[:file].content_type)
    blob.update!(created_user_id: current_user.id)

    render json: blob.slice(:id, :service_url, :filename, :content_type)
  end

  private

  def check_params!
    render(json: { errors: [{ message: 'file is blank', i18n_message: '文件不能为空', code: 401 }] }, status: 401) and return if params[:file].blank?
  end
end
