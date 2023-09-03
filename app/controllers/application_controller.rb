class ApplicationController < ActionController::Base
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  before_action :authorize

  def authorize 
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private 

  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.erros.full_messages}, status: :unprocessable_entity
  end
end
