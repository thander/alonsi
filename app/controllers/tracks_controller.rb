class TracksController < ApplicationController
  def topcharts
    @tracks = $lastfm.chart.get_top_tracks()
    render 'tracks'
  end

  def random
    @tracks = $lastfm.chart.get_loved_tracks()
    render 'tracks'
  end

  def index
    render nothing: :true
  end
end
