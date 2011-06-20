class Comment < ActiveRecord::Base
  belongs_to :quote
  validates :content, :presence => true, :length => { :maximum => 140 }  
end
