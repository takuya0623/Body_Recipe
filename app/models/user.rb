class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  validates :username, presence: true
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
  
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

# ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

# フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  def unsubscribe!
    
    ActiveRecord::Base.transaction do
      update!(is_deleted:true)
      comments.each do |comment| 
      comment.destroy! 
      end

      followed.each do |follow| 
        follow.destroy! 
      end

      follower.each do |follow| 
        follow.destroy! 
      end

      favorites.each do |favorite| 
        favorite.destroy! 
      end
        
      posts.each do |post| 
        post.destroy! 
      end

      
    end
    begin
      # 成功時
    rescue => e
      Rails.logger.info "Rendering 500 with Exception: #{e}"
    end
  end
end


