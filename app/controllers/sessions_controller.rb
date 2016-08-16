class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to posts_path
    end
  end

  def delete
    sign_out
    redirect_to posts_path
  end
end
