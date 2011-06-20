class AddQuoteIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :quote_id, :integer
  end

  def self.down
    remove_column :comments, :quote_id
  end
end
