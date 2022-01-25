class HomeController < ApplicationController
  def index
    redirect_to url_path if helpers.logged_in?
  end

  def redirect
    @url = Url.find_by(name: params[:name])

    if @url.present?
      redirection_side_effects
      redirect_to @url.url, allow_other_host: true
    else
      redirect_to root_path
    end
  end

  private

  def redirection_side_effects
    @url.clicks += 1

    @url.save
  end
end
