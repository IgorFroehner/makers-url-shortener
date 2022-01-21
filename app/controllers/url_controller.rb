class UrlController < ApplicationController
  before_action :require_user_logged_in!

  def new
    @url = Url.new
  end

  def create
    @url.new(url_params)
    if @url.save
      redirect_to @url, notice: 'Url encurtada com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index; end

  private

  def url_params
    params.require(:url).permit(:url, :apelido)
  end
end
