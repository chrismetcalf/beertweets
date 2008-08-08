class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.integer :twitter_id
      t.string :screen_name
      t.string :name
      t.string :description
      t.string :url
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end
