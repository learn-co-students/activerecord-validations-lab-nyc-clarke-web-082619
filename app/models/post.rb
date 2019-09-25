class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "category can only be Fiction or Non-Fiction"  }

    validate :title_clickbaity

    def title_clickbaity

        if title != nil 
            validation_array = ["Won't Believe", "Secret", "Top [number]", "Guess"]
    
            if !validation_array.any? {|words| title.include?(words) }
                errors.add(:title, "Title must be clickable")
            end
        end 
    end
end
