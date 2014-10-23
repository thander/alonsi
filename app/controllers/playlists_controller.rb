class PlaylistsController < ApplicationController
  before_filter :authenticate_user!, except: [:create, :destroy, :show, :index]
  skip_before_filter :verify_authenticity_token, :only => :create

  def main_playlist
    main_playlist = current_user.playlists.where(main:true).first
  end

  def create_track
    new_track = main_playlist.tracks.create(permitted_params)
    render json: {code: 200}, status: 200
  end

  def index
    @tracks = main_playlist.tracks
    render "playlists/index"
  end

  private

  def permitted_params
    params.require(:track).permit(:name, :duration, {:artist => :name}, {:image => [:content]})
  end

end
