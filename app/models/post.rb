class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :must_have_clickbait_words

    def must_have_clickbait_words 
        @phrase = ["Won't Believe", "Secret", "Top", "Guess"]
        if title 
            if !(@phrase.any?{|p| title.include?(p)})
                errors.add(:title, "Must contain clickbait words")
            end 
        end 
    end 
end
