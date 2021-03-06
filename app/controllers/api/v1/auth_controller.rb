class Api::V1::AuthController < ApplicationController
  # //handles login
  skip_before_action :authorized, only: [:create, :autologin]


  def create
    @user = User.find_by(username: user_login_params[:username])
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end


  def autologin
    @token = params[:token]
    # byebug
    user = User.find(JWT.decode(@token, 'my_s3cr3t', true, algorithm: 'HS256')[0]["user_id"])
    render json: user
  end

  private

  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:user).permit(:username, :password)
  end
end