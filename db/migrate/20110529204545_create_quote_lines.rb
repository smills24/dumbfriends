class CreateQuoteLines < ActiveRecord::Migration
  def self.up
    create_table :quote_lines do |t|
      t.string :name
      t.string :said
      t.references :quote

      t.timestamps
    end
  end

  def self.down
    drop_table :quote_lines
  end
end
