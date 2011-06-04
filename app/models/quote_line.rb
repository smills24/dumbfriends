class QuoteLine < ActiveRecord::Base
  belongs_to :quote
  validates :name, :presence => true, :length => { :maximum => 15 }
  validates :said, :presence => true, :length => { :maximum => 140 }
end
