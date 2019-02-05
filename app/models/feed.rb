class Feed < ApplicationRecord
  # Feedモデルのimageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates :text, presence: true
end
