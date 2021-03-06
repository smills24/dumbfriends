require 'test_helper'

class CommentTest < ActiveSupport::TestCase

test 'comment has content attribute' do
  comment = Comment.new
  assert_respond_to(comment, :content)
end

test 'comment doesnt save long content' do
  long_content = "b"*141
  invalid_comment = Comment.new(:content => long_content)
  assert !invalid_comment.save
end

test 'comment doesnt save without content' do
  invalid_comment = Comment.new
  assert !invalid_comment.save
end

test 'comment has quote id' do
  @comment = Comment.new
  assert_respond_to(@comment, :quote_id)
end

end
