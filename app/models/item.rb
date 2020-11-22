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
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range" }
    validates_format_of :price, with: /\A\d{3,}+\z/, message: 'Half-width number'

    with_options numericality: { other_than: 1, message: "Select" } do
      validates :category_id
      validates :condition_id
      validates :fee_id
      validates :prefecture_id
      validates :day_id
    end
  end

end