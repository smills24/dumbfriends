class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.integer :likes, :default => 0
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
