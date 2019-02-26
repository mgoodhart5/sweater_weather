class Api::V1::UsersController < ApplicationController
  def create
    if password_match
      user = User.create(user_params)
      if user.save
        user.api_key = SecureRandom.hex(10)
        user.save
        render json: UserSerializer.new(user), status: 201
      end
    else
      render json: "You typed the incorrect things, you get nothing!"
    end
  end

  private

  def password_match
    params[:password] == params[:password_confirmation]
  end

  def user_params
    params.permit(:email, :password)
  end
end
