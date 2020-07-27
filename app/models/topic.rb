class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  # それぞれのtopicは１つのuserに所属している。１つなのでモデル名は単数形。
  belongs_to :user
  
  # Imageuploaderファイルとtopicモデルのimageカラムを紐付ける
  mount_uploader :image, ImageUploader
end
