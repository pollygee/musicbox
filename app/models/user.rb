class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:spotify]

  has_many :votes
  has_many :songs

  serialize :spotify_data, JSON

  before_create do 
    self.votes_left ||= 10
  end
end
