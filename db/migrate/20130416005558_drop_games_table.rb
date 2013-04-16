class DropGamesTable < ActiveRecord::Migration
  def down
  	drop_table :games
  end
end
