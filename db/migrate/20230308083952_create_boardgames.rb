class CreateBoardgames < ActiveRecord::Migration[7.0]
  def change
    create_table :boardgames do |t|
      t.string :name

      t.timestamps
    end
  end
end
