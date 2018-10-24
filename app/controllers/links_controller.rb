class LinksController < ApplicationController

    def index
        @links = Link.all
    end

    def show
        @link = Link.find_by_shorthand(params[:shorthand])
        redirect_to @link.origin
    end

end
