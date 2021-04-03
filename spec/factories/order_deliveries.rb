FactoryBot.define do
  factory :order_delivery do
    municipalities { '山田市' }
    address        { '1-1' }
    postal_code    { '000-0000' }
    phone_number   { '00000000000' }
    area_id        { 3 }
    building       { '山田ビル' }
    token          { 'tok_abcdefghijk00000000000000000' }    
  end
  
end
