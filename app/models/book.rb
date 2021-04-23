class Book < ApplicationRecord
  belongs_to :user

  scope :by_topic, -> (topic) { where("topic = ?", topic) }
end
