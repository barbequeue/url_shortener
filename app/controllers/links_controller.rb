class LinksController < ApplicationController

    def index
        @links = Link.all
        @link = Link.new
    end

    def create
        @link = Link.new(link_params)
        @link.shorthand = get_shorthand
        if @link.save
            redirect_to root_path
        else
            redirect_to 'https://google.com'
        end
    end

    def show
        @link = Link.find_by_shorthand(params[:shorthand])
        redirect_to @link.origin
    end

    private
        def link_params
            params.require(:link).permit(:origin)
        end

        def get_shorthand
            symbs = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
            (0..7).map { symbs[rand(symbs.length)] }.join
        end

end
