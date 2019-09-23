class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Non-Fiction Fiction)}
    validate :clickbaity

    def clickbaity
        if title
            errors.add(:title, "is not clickbaity enough") unless (%w(Won't\ Believe Secret Top\ [number] Guess)).any? {|word| title.include?(word)} 
        end
    end
end
