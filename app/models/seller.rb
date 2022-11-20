class Seller < ApplicationRecord
  has_many :people, dependent: :destroy
end
