class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :prefecture_id
    validates :day_id
    validates :price
  end

end