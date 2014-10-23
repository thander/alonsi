class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  has_and_belongs_to_many :playlists
  after_create            :create_playlist


  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  # Setup accessible (or protected) attributes for your model
  field :password,              type: String, default: ""
  field :password_confirmation, type: String, default: ""
  field :remember_me,           type: String, default: ""
  field :nickname,              type: String, default: ""
  field :provider,              type: String, default: ""
  field :url,                   type: String, default: ""
  field :username,              type: String, default: ""
  field :avatar,                type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String


  field :name, type: String
  field :last_name, type: String
  field :username, type: String
  field :token, type: String

  def create_playlist
    self.playlists.create(name:"Main")
  end


  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user.update(token: access_token.credentials.token, :avatar => access_token.info.image, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain)
      user
    else
      @user = User.create!(token: access_token.credentials.token, :avatar => access_token.info.image, :provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => "noemail@email.com", :password => Devise.friendly_token[0,20])
    end
  end



end
