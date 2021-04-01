class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
  end

  validates :price, presence: true, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999 },
                    format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :shipping_day

  validates :category_id, :status_id, :burden_id, :area_id, :shipping_day_id, numericality: { other_than: 1 }
end
