class Post < ApplicationRecord

    # Post Basic validations is expected to validate that :title cannot be empty/falsy
    validates :title, presence: true

    # Post Basic validations is expected to validate that the length of :content is at least 250
    validates :content, length: { minimum: 250 }

    # Post Basic validations is expected to validate that the length of :content is at least 250
    validates :summary, length: { maximum: 250 }

    # Post Basic validations is expected to validate that :category is either ‹"Fiction"› or ‹"Non-Fiction"›
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    # Post Custom validations: title is clickbait is expected not to allow :title to be ‹"True Facts"›
    validate :title_is_clickbait

    def title_is_clickbait
        if title && !title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, "must be clickbait")
        end
    end
end
