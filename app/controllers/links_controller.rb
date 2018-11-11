class LinksController < ApplicationController
    before_action :set_cookies, :find_session_links, only: [:new, :create]

    def new
        @link = Link.new
    end

    def create
        @link = Link.new(link_params)
        @link.validate
        @link = Link.find_or_create_by(:origin => @link.origin, :session => cookies.signed[:session])
        render 'new'
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

        def set_cookies
            cookies.signed.permanent[:session] = Link.give_shorthand unless cookies.signed[:session]
            @cookies = cookies
        end

        def find_session_links
            @links = Link.where(session: cookies.signed[:session])
        end

end
