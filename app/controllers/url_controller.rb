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

    if @url.present?
      redirection_side_effects
      redirect_to @url.url, allow_other_host: true
    else
      redirect_to root_path
    end
  end

  def destroy
    @url = helpers.current_user.url.find_by(name: params[:name])

    if @url.present?
      @url.destroy
      redirect_to urls_path, status: :see_other, notice: "URL deletada com sucesso"
    else
      redirect_to urls_path, status: :not_found, alert: "URL não encontrada"
    end
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

  def redirection_side_effects
    @url.clicks += 1

    @url.save
  end
end
