class Song < ActiveRecord::Base
  belongs_to :user

  has_many :votes
  has_many :users, through: :votes

  validates_presence_of :title, :artist
  validates_uniqueness_of :title, scope: :artist

  def self.by_sort_letter
    all.group_by { |s| s.sort_letter }
  end

  def total_votes
    # votes.sum(:value)
    Vote.where(song_id: self.id).sum(:value)
  end

  def sort_letter
    title.chars.first.upcase
  end
end
