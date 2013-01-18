class CharitiesController < ApplicationController
  before_filter :signed_in_user, except: [:index, :set]

  def index
    @charities = Charity.paginate(page: params[:page])
  end

  def set
    session[:charity] = params[:id]
    redirect_to merchants_path
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def destroy
    Charity.find(params[:id]).delete
    redirect_to charities_path and return
  end

  private

    def signed_in_user
      redirect_to new_user_session_url, notice: "Please sign in." unless user_signed_in?
    end
end
