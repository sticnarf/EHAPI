class Gallery < ApplicationRecord
  has_many :pictures, foreign_key: :gid, primary_key: :gid
end
