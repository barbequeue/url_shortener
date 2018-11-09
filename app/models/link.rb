class Link < ApplicationRecord
    validate :origin_must_be_valid_link
    validates :origin, presence: true

    before_create do
        give_shorthand if self.shorthand.nil?
    end 

    private

        def origin_must_be_valid_link
            self.origin = RestClient.get(origin).request.url
        rescue StandardError => err
            errors.add( :origin, err.to_s )
        end

        def give_shorthand
            symbs = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
            self.shorthand = (0..7).map { symbs.sample }.join
        end
       
end
