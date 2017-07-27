class Like < ApplicationRecord
  validates_uniqueness_of :story_id, scope: :user_id
end
