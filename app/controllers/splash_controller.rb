class SplashController < ApplicationController
  def index
    redirect_to authenticated_root_path if user_signed_in?
  end
end