class OrderDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :address, :building, :phone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :area_id
    validates :municipalities
    validates :address
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end