class LinksController < ApplicationController

    def index
        @links = Link.all
    end

    def new
        @link = Link.new
    end

    def create
        @link = Link.find_by_origin(params[:link][:origin])
        if @link.nil?
            @link = Link.new(link_params)
            if @link.valid?
                @link.shorthand = get_shorthand
                @link.save
            end
        end
        render 'new'
    end

    def show
        @link = Link.find_by_shorthand(params[:shorthand])
        if @link.nil?
            flash[:danger] = "There is no link like this."
            redirect_to root_path
        else
            redirect_to @link.origin
        end
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
