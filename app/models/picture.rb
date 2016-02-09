class Picture < ApplicationRecord
  belongs_to :gallery, foreign_key: :gid, primary_key: :gid
end
