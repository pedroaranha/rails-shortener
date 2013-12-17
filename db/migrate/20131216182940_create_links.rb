class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :short_url
      t.text :long_url
      t.integer :hits, :default => 0
      t.integer :http_status, :default => 301 # default to :permanent

      t.timestamps
    end
    add_index :links, :short_url
  end
end
