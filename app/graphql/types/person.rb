class Types::Person < Types::BaseObject
  field :id, ID,
        null: false

  field :name, String,
        null: false,
        description: 'Name.'

  field :city_id, ID,
        null: false,
        description: 'City ID.'

  field :city, Types::City,
        null: false,
        description: 'City.'

  field :seller_id, ID,
        null: false,
        description: 'Seller ID.'

  field :seller, Types::Seller,
        null: false,
        description: 'Seller.'
end
