class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :post_must_be_click_bait

    CLICK_BAIT = [/Won't Believe/i, 
                /Secret/i, 
                /Top [0-9]/i, 
                /Guess/i]

    private
        def post_must_be_click_bait        
            unless CLICK_BAIT.any?{|cb| cb.match title}
                errors.add(:title, " needs more click bait.")
            end
        end

end
