class AddCoordinatesToBoardgames < ActiveRecord::Migration[7.0]
  def change
    add_column :boardgames, :latitude, :float
    add_column :boardgames, :longitude, :float
  end
end
