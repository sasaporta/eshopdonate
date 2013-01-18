class CharitiesController < ApplicationController
  def show
    (redirect_to root_path and return) if !user_signed_in?
    @charity = Charity.find(params[:id])
  end

  def index
    @charities = Charity.paginate(page: params[:page])
  end

  def set
    session[:charity] = params[:id]
    redirect_to merchants_path
  end
end
