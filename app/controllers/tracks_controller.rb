class TracksController < ApplicationController
  def topcharts
    @topcharts = $lastfm.chart.get_top_tracks()
  end

  def index
    render nothing: :true
  end
end
