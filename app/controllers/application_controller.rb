class ApplicationController < ActionController::API
  include AuthHelper

  def uploads
    Svc::PdfGenerate.call(params[:file])
    redirect_to('/result.pdf')
  end
end
