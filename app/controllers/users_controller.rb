class UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy, :show, :index]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def update_image
    user = User.find(params[:id])

    if params[:profile_image]
      image = Cloudinary::Uploader.upload(params[:profile_image])
      user.profile_image = image["url"]
    end

    if user.save(validate: false) # Skip validation for other fields
      render json: user, status: :accepted
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: { user: authorize }
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head :no_content
  end

  def changePass
    user = User.find_by(email: params[:email])
    user.update(password: params[:password],
                password_confirmation: params[:password])
    render json: user
  end

  def add_to_wishlist
    user = User.find(params[:user_id])
    user.update(wishlist: params[:wishlist])
    render json: user
  end

  def remove_from_wishlist
    user = User.find(params[:user_id])
    updated_wishlist = user.wishlist.reject { |id| id == params[:hostel_id].to_i }
    user.update(wishlist: updated_wishlist)
    render json: user
  end

  private

  def user_params
    params.permit(:id, :user, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :role)
  end

  def render_not_found_response
    render json: { errors: ["User Not Found"] }, status: :not_found
  end

  def render_unprocessable_entity(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
