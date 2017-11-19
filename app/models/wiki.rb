class Wiki < ApplicationRecord
  belongs_to :user
  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { order('created_at ASC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }
end
