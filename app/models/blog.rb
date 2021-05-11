class Blog < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :blog_comments, dependent: :destroy
end
