class MyValidator < ActiveModel::Validator
    def validate(record)
        if !record.title
            record.errors[:title] << 'no title'
        else   
            a = record.title.include?("Won't Believe")
            b = record.title.match(/\w+ "Secret" \w+/)
            c = record.title.match(/\w+ "Top" + \d+/)
            d = record.title.match(/\w+ "Guess"\w+/)
            puts "THIS IS a"
            p a
            if (!a && !b && !c && !d)
                record.errors[:title] << 'Need a better title'
            end
        end
    end
end


class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validates_with MyValidator
end
