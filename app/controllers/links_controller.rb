class LinksController < ApplicationController
  before_action :set_user, :find_user_links, only: [:index, :create]
  before_action :save_user, only: [:index]

  def index
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.validate
    @link = Link.find_or_create_by(origin: @link.origin,
                                   session: @user.session_id)
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
    @user = User.find_or_create_by(session_id: cookies.signed[:session])
    @session = cookies.signed[:session]
  end

  def save_user
    cookies.signed.permanent[:session] = @user.session_id unless cookies.signed[:session]
  end

  def find_user_links
    @links = Link.where(session: @user.session_id)
  end
end
