class LinksController < ApplicationController
  before_action :set_user,  only: [:index, :create]
  before_action :save_user, only: [:index]

  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.validate
    @link = @user.links.find_or_create_by(origin: @link.origin)
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

  def set_user
    @user = User.find_or_create_by(id: cookies.signed[:user_id])
  end

  def save_user
    cookies.signed.permanent[:user_id] = @user.id unless cookies.signed[:user_id]
  end
end
