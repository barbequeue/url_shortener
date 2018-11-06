class Link < ApplicationRecord
    validate :origin_must_be_valid_link
    validates :origin, presence: true

    before_save do
        give_shorthand if self.shorthand.nil?
    end 

    private

        def origin_must_be_valid_link
            begin
                self.origin = RestClient.get(self.origin).request.url
            rescue StandardError => err
                errors.add( :origin, err.to_s )
            end
        end

        def give_shorthand
            symbs = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
            self.shorthand = (0..7).map { symbs[rand(symbs.length)] }.join
        end
       
end
