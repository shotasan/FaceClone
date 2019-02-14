class Feed < ApplicationRecord
  # Feedモデルのimageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :text, presence: true, length: { maximum: 255 }
  belongs_to :user
end
