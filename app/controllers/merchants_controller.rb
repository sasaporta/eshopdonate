class MerchantsController < ApplicationController
    def show
    @merchant = Merchant.find(params[:id])
  end

  def index
    @merchants = Merchant.paginate(page: params[:page])
  end
end
