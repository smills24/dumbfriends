class RemoveCommentFromQuotes < ActiveRecord::Migration
  def self.up
    remove_column :quotes, :comment
  end

  def self.down
    add_column :quotes, :comment
  end
end
