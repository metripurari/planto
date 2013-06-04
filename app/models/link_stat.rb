class LinkStat < ActiveRecord::Base
  belongs_to :link
  attr_accessible :comment_count, :like_count, :link_is, :share_count
end
