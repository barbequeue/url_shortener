class Link < ApplicationRecord
    URL_VALIDATION_REGEX = /\A(http|https|)(:\/\/|)[a-zа-я0-9]+([\-\.]{1}[a-zа-я0-9]+)*\.[a-zа-я]{2,5}(:[0-9]{1,5})?(\/.*)?/ix

    validates :origin, presence: true, format: { with: URL_VALIDATION_REGEX }

end
