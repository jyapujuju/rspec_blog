class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :author, presence: true
  validates :content,length:{minimum:50}, presence:true
end
