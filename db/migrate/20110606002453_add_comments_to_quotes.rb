class AddCommentsToQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :comment, :string
  end

  def self.down
    remove_column :quotes, :comment
  end
end
