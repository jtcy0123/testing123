class Mood < ApplicationRecord
  validates :emotion, uniqueness: true
end
