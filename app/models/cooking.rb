class Cooking < ApplicationRecord
  belongs_to :genre

  validates :title, presence: true
  validates :content, presence: true

  def self.search(dish_name, genre_id)
    results = all
    results = results.where("title LIKE ?", "%#{dish_name}%") if dish_name.present?
    results = results.where(genre_id: genre_id) if genre_id.present?
    results
  end
end
