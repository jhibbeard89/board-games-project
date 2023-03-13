class AddAddressToBoardgames < ActiveRecord::Migration[7.0]
  def change
    add_column :boardgames, :address, :string
  end
end
