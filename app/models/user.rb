class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  
  VARID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VARID_EMAIL_REGEX }
  
  VARID_PASSWORD_REGEX = /\A(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-Z0-9]+)\z/
  # length: { in: 8..32 }の書き方もできる
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }, format: { with: VARID_PASSWORD_REGEX } 
  
  
  has_secure_password
  
  # １つのUserは複数のtopicを持つ。has_manyの場合はRailsの命名規則で必ずモデル名を複数形にする。
  has_many :topics
  has_many :favorites
  # throughを使うことでログインしているユーザーがいいねしているtopicを全て取得できる。
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'
end
