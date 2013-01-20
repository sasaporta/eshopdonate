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

  def new
    @charity = Charity.new
  end

  def create()
    @charity = Charity.new(params[:charity])
    if @charity.save
      flash[:success] = "New charity added"
      redirect_to charities_path
    else
      render 'new'
    end
  end

  def update
    @charity = Charity.find(params[:id])
    if @charity.update_attributes(params[:charity])
      flash[:success] = "Charity updated"
      redirect_to charities_path
    else
      render 'edit'
    end
  end

  def destroy
    Charity.find(params[:id]).delete
    redirect_to charities_path
  end

  private

    def signed_in_user
      redirect_to new_user_session_url, notice: "Please sign in." unless user_signed_in?
    end
end
