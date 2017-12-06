class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :date
      t.string :aircraft_type
      t.string :aircraft_ident
      t.string :pic
      t.string :sic
      t.decimal :day_hours, :precision => 10, :scale => 1
      t.decimal :night_hours, :precision => 10, :scale => 1
      t.boolean :is_single_engine, default: true
      t.boolean :is_xc, default: false
      t.boolean :is_dual, default: false
      t.decimal :hood_hours, :precision => 10, :scale => 1
      t.decimal :imc_hours, :precision => 10, :scale => 1
      t.decimal :sim_hours, :precision => 10, :scale => 1
      t.integer :ifr_apprs
      t.string :route
      t.text :comments
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :flights, [:user_id, :date]
  end
end
