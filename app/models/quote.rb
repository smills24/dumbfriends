class Quote < ActiveRecord::Base
  has_many :quote_lines, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :quote_lines

  validates :title, :presence => true, :length => {:maximum => 20}

  default_scope :order => 'quotes.created_at DESC'

  def like!
    self.likes += 1
    self.save
  end

  def commented
    Comment.where("quote_id = ?", self.id).length
  end

end

