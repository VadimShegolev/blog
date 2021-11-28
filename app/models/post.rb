class Post < ApplicationRecord

    has_one_attached :image
    belongs_to :user, foreign_key: 'user_id'
    has_and_belongs_to_many :tags

    acts_as_votable

    after_create do
        post = Post.find_by(id: self.id)
        hashtags = self.body.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
            post.tags << tag
        end
    end

    before_update do
        post = Post.find_by(id: self.id)
        post.tags.clear
        hashtags = self.body.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
            tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
            post.tags << tag
        end
    end
end
