class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_purchase, only: [:index, :create]
  before_action :purchase_user_judge, only: [:index, :create]
  before_action :purchase_judge, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_purchase
    @item = Item.find(params[:item_id])
  end

  def purchase_user_judge
    redirect_to root_path if (current_user.id = @item.user_id)
  end

  def purchase_judge
    redirect_to root_path if @item.purchase.present?
  end

  def purchase_params
    params.require(:purchase_address).permit(:postcode, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
