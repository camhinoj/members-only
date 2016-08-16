class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def new
    current_user
    @post = Post.new()
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "You've made a new post"
      redirect_to posts_path
    else
      flash.now[:error] = "Something went wrong"
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in for this section"
        redirect_to login_url
      end
    end

    def post_params
      params.require(:post).permit(:title,:post_body, :user_id)
    end

end
