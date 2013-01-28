class MerchantsController < ApplicationController
  before_filter :signed_in_user, except: [:index, :shop]

  def index
    redirect_to charities_path if session[:charity].nil?
    @merchants = Merchant.paginate(page: params[:page])
  end

  def shop
    @merchant = Merchant.find(params[:id])
    @link = @merchant.link + "&u1=" + session[:charity]
    @impression = Impression.new(link: @link)
    @impression.save
    redirect_to @link
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def new
    @merchant = Merchant.new
  end

  def create()
    @merchant = Merchant.new(params[:charity])
    if @merchant.save
      flash[:success] = "New merchant added"
      redirect_to merchants_path
    else
      render 'new'
    end
  end

  def update
    @merchant = Merchant.find(params[:id])
    if @merchant.update_attributes(params[:merchant])
      flash[:success] = "Merchant updated"
      redirect_to merchants_path
    else
      render 'edit'
    end
  end

  def destroy
    Merchant.find(params[:id]).delete
    redirect_to merchants_path
  end

  private

    def signed_in_user
      redirect_to new_user_session_url, notice: "Please sign in." unless user_signed_in?
    end
end
