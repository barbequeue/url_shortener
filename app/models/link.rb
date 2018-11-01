class Link < ApplicationRecord
    URL_VALIDATION_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix

    validates :origin, presence: true, format: { with: URL_VALIDATION_REGEX }

end
