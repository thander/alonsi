class Playlist
  include Mongoid::Document

  has_and_belongs_to_many :users
  has_and_belongs_to_many :tracks

  field :name,       type: String, default: ""
  field :main,       type: Boolean, default: true


end
