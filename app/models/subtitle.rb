class Subtitle < ActiveRecord::Base
  serialize :vocabulary, JSON
  serialize :pinyin, JSON
  belongs_to :movie
  validates :filename, presence: true, uniqueness: true
  validates :movie_id, presence: true
  has_many :comments, dependent: :destroy
  has_many :reverse_examples, foreign_key: "subtitle_id", class_name: "Example", dependent: :destroy
  has_many :expressions, through: :reverse_examples, source: :expression
  default_scope -> { order('filename ASC') }
end
