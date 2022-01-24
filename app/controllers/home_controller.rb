class HomeController < ApplicationController
  def index
    redirect_to url_path if helpers.logged_in?
  end
end
