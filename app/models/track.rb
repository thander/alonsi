class Track
  include Mongoid::Document

  has_and_belongs_to_many :playlists

  field :artist,                type: Hash, default: {}
  field :duration,              type: String, default: ""
  field :image,                 type: Array, default: []
  field :name,                  type: String, default: ""

end
