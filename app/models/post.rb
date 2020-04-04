class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary, :body, presence: true
  validates :summary, length: { minimum: 5, maximum: 150 }
  has_rich_text :body

  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :category

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end
end
