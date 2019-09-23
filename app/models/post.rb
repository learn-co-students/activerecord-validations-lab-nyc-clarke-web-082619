class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title, :non_clickbait


    def non_clickbait
        if title.present?
            if !(["Won't Believe", "Secret", "Top", "Guess"].any? {|phrase| title.include? phrase})
                errors.add(:title, "must be clickbaity")
            end
        end
    end

end
