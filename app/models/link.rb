class Link < ActiveRecord::Base

  require 'rest_client'

  has_one :link_stat

  attr_accessible :url

  before_create :create_stats

  def name
  	"http://api.facebook.com/restserver.php?method=links.getStats&urls=#{url}"
  end

  private

  def create_stats
  	stats = Hash.from_xml(RestClient.get(name, {:accept => :xml}))
  	self.build_link_stat(stats['links_getStats_response']['link_stat'])  	
  end
end