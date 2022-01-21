class Url < ApplicationRecord
  validates :url, presence: true
  validates :name, presence: true, uniqueness: true
end
