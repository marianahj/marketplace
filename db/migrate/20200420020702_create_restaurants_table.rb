class CreateRestaurantsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string  :name
      t.string  :description
      t.string  :website
      t.integer :status
      t.string  :shareable_link
      t.integer :category
      t.string  :facebook_url
      t.string  :twitter_url
      t.string  :instagram_url

      t.timestamps
    end
  end
end
