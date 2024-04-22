class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags

    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
end