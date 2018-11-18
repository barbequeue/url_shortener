class User < ApplicationRecord
  has_many :links

  validates :name, presence: true, uniqueness: true

  before_validation :ensure_name_has_value, :ensure_name_is_unique

  private

  def ensure_name_has_value
    self.name = "user_#{Link.give_shorthand}" if name.nil?
  end

  def ensure_name_is_unique
    unless self.name
      loop do
        self.name = "user_#{Link.give_shorthand}"
        break unless User.exists?(name: name)
      end
    end
  end
end
