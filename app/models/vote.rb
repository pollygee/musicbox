class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  validates_presence_of :user, :song, :value
  validates_inclusion_of :value, in: [-1, 1]
end
