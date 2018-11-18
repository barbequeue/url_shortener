class LinksController < ApplicationController
  before_action :require_user,  only: [:index, :create]
  before_action :save_user, only: [:index]

  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.validate
    @link = Link.find_or_create_by(origin: @link.origin,
                                   user_id: @user.id)
    render :index
  end

  def show
    @link = Link.find_by_shorthand(params[:shorthand])
    redirect_to @link.origin and return if @link
    redirect_to root_path
    flash[:danger] = "This link doesn't exists!"
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).permit(:origin)
  end

  def require_user
    @user = User.find_or_create_by(name: cookies.signed[:user_name])
  end

  def save_user
    cookies.signed.permanent[:user_name] = @user.name unless cookies.signed[:user_name]
  end
end
