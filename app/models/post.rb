class Post < ActiveRecord::Base
  validates :title,length:{maximum:35}, presence: true
  validates :author, presence: true
  validates :content,length:{minimum:50}, presence:true

  default_scope { order("created_at DESC") }
  attr_accessor :accepts
  scope :featured, -> { where(featured: true) }
  scope :not_featured, -> { where(featured: false) }
end
