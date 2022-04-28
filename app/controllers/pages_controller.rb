class PagesController < ApplicationController
    def index
        @pages=Page.all
    end
    def show
        @page=Page.find(params[:id])
    #    render plain:@page.title
    end
    def new
        @page=Page.new
    end
    def create
        # @page=Page.new(params)
        # render plain: params.to_json
        page_params=params.require(:page).permit(:title,:body,:slug)
        @page=Page.new(page_params)
        @page.save
        redirect_to @page
    end
  
end
