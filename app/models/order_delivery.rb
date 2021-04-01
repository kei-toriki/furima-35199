class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :address, :building, :phone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :area_id
    validates :municipalities
    validates :address
    validates :order_id
    validates :postal_code, format: format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end
end