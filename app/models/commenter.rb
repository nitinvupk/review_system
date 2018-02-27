class Commenter < ApplicationRecord
  belongs_to :user
  belongs_to :movie, optional: true
  has_many :reply, class_name: 'Commenter', foreign_key: :parent_id
end
