class Collaboration < ApplicationRecord
  belongs_to :wiki_params
  belongs_to :user
end
