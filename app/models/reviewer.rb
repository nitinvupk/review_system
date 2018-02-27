class Reviewer < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates_inclusion_of :rating_point, :in => 1..10
end
