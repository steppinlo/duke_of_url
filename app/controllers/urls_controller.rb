class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
  end

  #post route
  def create
    shortened = new_link
    url = Url.new(original: url_params[:original], shortened: shortened)
    if url.save
      redirect_to '/'
    else
      [500, "uh oh! error!"]
    end
  end

  def destroy
  end

  private

  def url_params
    params.require(:urls).permit(:original)
  end
end
