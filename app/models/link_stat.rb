class LinkStat < ActiveRecord::Base
	belongs_to :link
  attr_accessible :comment_count, :like_count, :link_is, :share_count
  attr_accessible :url, :normalized_url, :total_count, :click_count, :comments_fbid, :commentsbox_count
  attr_accessor :url, :normalized_url, :total_count, :click_count, :comments_fbid, :commentsbox_count
end
