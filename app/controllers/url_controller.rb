class UrlController < ApplicationController
  before_action :require_user_logged_in!

  def new
    @url = Url.new
  end

  def create
    @url = helpers.current_user.url.new(url_params)

    if @url.save
      redirect_to @url
    else
      redirect_to :new, status: :unprocessable_entity, alert: concatenate_error_message
    end
  end

  def index; end

  def show
    @url = helpers.current_user.url.find_by(name: params[:name])
    redirect_to root_path, alert: "Não existe URL com o apelido #{params[:name]}" if @url.blank?
  end

  def redirect
    @url = helpers.current_user.url.find_by(name: params[:name])

    @url.clicks += 1
    @url.save

    redirect_to @url.url, allow_other_host: true
  end

  private

  def url_params
    params.require(:url).permit(:url, :name)
  end

  def concatenate_error_message
    message = 'Erro ao salvar essa URL'
    @url.errors.full_messages.each do |msg|
      message += ": #{msg}"
    end
    message
  end
end
