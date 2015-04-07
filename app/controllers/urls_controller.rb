class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @link = Url.find_by(shortened: params[:id])
    @link.click_count += 1
    if @link.save
      redirect_to "#{@link.original}"
    else
      [404, "link failed to save"]
    end
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
