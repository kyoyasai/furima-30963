class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postcode,      format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'Input only number (Within 11 digits)' }
    validates :token
  end

  def save
    # 購入情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所情報を保存
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
