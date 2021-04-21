class Chapter < ApplicationRecord
  belongs_to :book
  belongs_to :user
end
