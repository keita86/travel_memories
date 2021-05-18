class Blog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :blog_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.last_day # メソッド名は何でも良いです
    Blog.joins(:favorites).where(favorites: { created_at:　Time.now.last_day}).group(:id).order("count(*) desc")
  end
  def self.last_week # メソッド名は何でも良いです
    Blog.joins(:favorites).where(favorites: { created_at:　0.days.ago.this_week..0.days.ago.this_week(:sunday)}).group(:id).order("count(*) desc")
  end
  def self.last_month # メソッド名は何でも良いです
    Blog.joins(:favorites).where(favorites: {created_at: Time.now.all_month}).group(:id).order("count(*) desc")
  end

end
