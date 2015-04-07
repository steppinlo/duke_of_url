class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by(id: params[:id])
  end

  def new
  end

  #post route
  def create
    shortened = new_link
    @url = Url.new(original: url_params[:original], shortened: shortened)
    if @url.save
      redirect_to @url
    else
      [500, "uh oh! error!"]
      flash[:notice] = "Invalid URL! Please include http/https!"
      redirect_to new_url_path
    end
  end

  def destroy
  end

  def link
    url = Url.find_by(shortened: params[:id])
    redirect_to "#{url.original}"
  end

  private

  def url_params
    params.require(:urls).permit(:original)
  end
end
