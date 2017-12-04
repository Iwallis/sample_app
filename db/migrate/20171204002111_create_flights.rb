class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.string :aircraft_type
      t.string :aircraft_ident
      t.string :pic
      t.string :sic
      t.decimal :day_hours, :precision => 10, :scale => 1
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :flights, [:user_id, :date]
  end
end
