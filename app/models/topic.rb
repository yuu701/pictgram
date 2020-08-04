class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  # それぞれのtopicは１つのuserに所属している。１つなのでモデル名は単数形。
  # belongs_to,has_manyでインスタンスを作っている。
  # この１文でuserモデルの指定とuser_idという外部キーを指定している。
  # この書き方だとuserモデルを指定するというのがRailsで決まっている。
  belongs_to :user
  
  # Imageuploaderファイルとtopicモデルのimageカラムを紐付ける
  mount_uploader :image, ImageUploader
  
  has_many :favorites
  # favorite_usersはただの名前。Railsの作法から外れているのでsourceでモデルを指定している。
  # favoriteモデルに紐づいているuserモデルの中のカラムはuser_idしかないのでuser_idと紐付けられる。
  has_many :favorite_users, through: :favorites, source: 'user'
  # dependent: :destroy => topic削除されたらcommentsも削除される
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: 'user'
end
