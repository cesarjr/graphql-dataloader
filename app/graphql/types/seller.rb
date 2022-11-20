class Types::Seller < Types::BaseObject
  field :id, ID,
        null: false

  field :name, String,
        null: false,
        description: 'Name.'
end
