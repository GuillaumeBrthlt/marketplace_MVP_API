class AddAdressToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :address, :string
    add_column :properties, :city, :string
    add_column :properties, :zipcode, :integer
    add_column :properties, :aera, :integer
    add_column :properties, :rooms, :integer
    add_column :properties, :furnished, :boolean
    add_column :properties, :car_park, :boolean
    add_column :properties, :has_outside, :boolean
    add_column :properties, :basement, :boolean
  end
end
