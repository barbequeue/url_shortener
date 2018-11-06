class LinksController < ApplicationController

    def index
        @links = Link.all
    end

    def new
        @link = Link.new
    end

    def create
        @link = Link.new(link_params)
        @link.validate
        @link = Link.find_or_create_by( :origin => @link.origin )
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
        redirect_to all_links_path
    end

    private

        def link_params
            params.require(:link).permit(:origin)
        end

end
