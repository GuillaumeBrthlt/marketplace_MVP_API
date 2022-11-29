class PropertySerializer
  include JSONAPI::Serializer
  attributes :id, :title, :price, :description, :user_id, :created_at, :updated_at, :address, :city,
:zipcode, :aera, :rooms, :furnished, :car_park, :has_outside, :basement, :picture_url
end
