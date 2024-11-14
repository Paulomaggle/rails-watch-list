class Bookmark < ApplicationRecord
  validates :comment, presence: true, length: { minimum: 6}
  # Validation de la présence des associations
  validates :movie, presence: true
  validates :list, presence: true
  # Validation d'unicité de la paire [movie_id, list_id]
  validates :movie_id, uniqueness: { scope: :list_id, message: "has already been bookmarked for this list" }
  belongs_to :movie
  belongs_to :list
end
