class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  default_scope { order('created_at DESC') }
  
  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nill])
  end
  
  validates :title, length: { minimum: 2 }, presence: true
  validates :title, length: { minimum: 5 }, presence: true
end
