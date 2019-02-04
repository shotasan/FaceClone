class Feed < ApplicationRecord
  # Feedモデルのimageカラムに、ImageUploaderを紐付けます。
  mount_uploader :image, ImageUploader
end
