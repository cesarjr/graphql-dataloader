class City < ApplicationRecord
  has_many :people, dependent: :destroy
end
