class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :first_name
      t.string :trigger
      t.string :file

      t.timestamps
    end

  end
end
