class Author < ApplicationRecord
    # Author Basic validations is expected to validate that :name cannot be empty/falsy
    validates :name, presence: true

    # Author Basic validations is expected to validate that :name is case-sensitively unique
    validates :name, uniqueness: true

    # Author Basic validations is expected to validate that the length of :phone_number is 10
    validates :phone_number, length: { is: 10 }
end
