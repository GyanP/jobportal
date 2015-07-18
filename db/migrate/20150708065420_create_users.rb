class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :state
      t.string :city
      t.string :street
      t.string :zip
      t.float :latitude
      t.float :longitude 
      t.integer :fb_id
      t.timestamps
    end
  end
end