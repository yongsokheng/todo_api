class Task < ApplicationRecord
  include RankedModel
  ranks :row_order

  validates :title, presence: true
end
