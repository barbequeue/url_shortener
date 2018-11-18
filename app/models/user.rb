class User < ApplicationRecord
  has_many :links

  before_save do
      self.name = "user_#{Link.give_shorthand}" unless name
  end
end
