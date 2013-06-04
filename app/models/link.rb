class Link < ActiveRecord::Base

  require 'rest_client'

  has_one :link_stat, :dependent => :destroy

  attr_accessible :url

  before_create :create_stats

  def name
  	"http://api.facebook.com/restserver.php?method=links.getStats&urls=#{url}"
  end

  def create_stats
  	stats = Hash.from_xml(RestClient.get(name, {:accept => :xml}))['links_getStats_response']
    [:url, :normalized_url, :total_count, 
     :click_count, :comments_fbid, :commentsbox_count].each{|key| stats['link_stat'].delete(key.to_s)}
  	self.build_link_stat(stats['link_stat'])  	
  end
end