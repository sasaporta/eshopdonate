class MerchantsController < ApplicationController
  def show
    @merchant = Merchant.find(params[:id])
  end

  def index
    redirect_to charities_path if session[:charity].nil?
    @merchants = Merchant.paginate(page: params[:page])
  end

  def shop
    @merchant = Merchant.find(params[:id])
    @impression = Impression.new(link: @merchant.link)
    @impression.save
    redirect_to @merchant.link
  end
end
