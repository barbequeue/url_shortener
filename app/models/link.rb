class Link < ApplicationRecord
  belongs_to :user

  validate :origin_must_be_valid_link
  validates :origin, presence: true
  validates :user_id, presence: true

  before_create do
    self.shorthand = Link.give_shorthand if shorthand.nil?
  end

  def self.give_shorthand
    SecureRandom.urlsafe_base64(6, false)
  end

  private

  def origin_must_be_valid_link
    self.origin = RestClient.get(origin).request.url
  rescue StandardError => err
    errors.add(:origin, err.to_s)
  end
end
