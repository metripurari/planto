class LinkStatsController < ApplicationController
  # GET /link_stats
  # GET /link_stats.json
  def index
    @link = Link.find_by_id(params[:link_id])
    @link_stat = @link.link_stat

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @link_stat }
    end
  end

  def update
    @link = Link.find_by_id(params[:link_id])
    @link_stat = @link.create_stats
    # @link_stat = LinkStat.find(params[:id])

    respond_to do |format|
      if @link_stat.update_attributes(params[:link_stat])
        format.html { redirect_to link_link_stats_path(@link.id) , notice: 'Link stat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @link_stat.errors, status: :unprocessable_entity }
      end
    end
  end
end
