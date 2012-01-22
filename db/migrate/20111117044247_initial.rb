class Initial < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :pickup_spot_id
      t.integer :number_of_seats, :null => false, :default => 0
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.timestamp :last_seen_at
      t.integer :destination_spot_id
      t.timestamps
    end

    create_table :riders do |t|
      t.integer :pickup_spot_id
      t.timestamp :last_seen_at
      t.integer :destination_spot_id
      t.timestamps
    end

    create_table :pickup_spots do |t|
      t.string :name
      t.decimal :lat, :precision => 15, :scale =>10
      t.decimal :lng, :precision => 15, :scale => 10
      t.timestamps
    end

    create_table :destination_spots do |t|
      t.string :name
      t.timestamps
    end
  end
end
