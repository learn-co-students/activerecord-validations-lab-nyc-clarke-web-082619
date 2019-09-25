class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbaity

  def clickbaity
    if title
        clickbait_phrases = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        clickbait = clickbait_phrases.any? { |phrase| title.include? phrase }
        if !clickbait
          errors.add(:title, "must be clickbaity")
        end
      end
    end

end
