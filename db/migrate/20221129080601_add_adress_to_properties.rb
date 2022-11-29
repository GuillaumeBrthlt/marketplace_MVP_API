class AddAdressToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :address, :string
    add_column :properties, :city, :string
    add_column :properties, :zipcode, :integer
  end
end
