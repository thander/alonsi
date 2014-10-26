class TagsController < ApplicationController


  def index
    @tags = $lastfm.chart.get_top_tags()
  end

  def tracks
    if params[:tag].blank?
      params[:tag] = "music"
    end
    @tracks = $lastfm.tag.get_top_tracks(tag: params[:tag])
    render 'tracks/tracks'
  end

end
