class Link < ApplicationRecord
  belongs_to :user

  validate :origin_must_be_valid_link
  validates :origin, presence: true
  validates :shorthand, uniqueness: true

  before_create do
    loop do
      self.shorthand = Link.give_shorthand if shorthand.nil?
      break unless Link.exists?(shorthand: shorthand)
    end
  end

  def self.give_shorthand
    SecureRandom.urlsafe_base64(6, false)
  end

  private

  def origin_must_be_valid_link
      self.origin = RestClient.get( origin ).request.url
  rescue StandardError
    errors.add(:origin, 'invalid link!')
  end
end
