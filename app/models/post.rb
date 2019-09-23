class Post < ActiveRecord::Base
    belongs_to :author

    validates :title, presence: true
    validates :content, length:{ minimum:250}
    validates :summary, length:{maximum:250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?


    def is_clickbait?
        if title
            clickbait = ["Won't Believe", "Secret", "Top [#{0..9}]", "Guess"]
            if !clickbait.any? {|item| title.include? item}
                errors.add(:title, "must be clickbait")
            end 
        end
    end
end
