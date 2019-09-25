class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait?

    def clickbait?
        if title
            if !['Secret','Top','Guess', "Won't Believe"].any? { |word| title.include?(word) }
            errors.add(:title, "Title needs to be more clickbait-y!!! hint: Add 'Secret' or 'Won't Believe' ")
            end
        end
    end
end
