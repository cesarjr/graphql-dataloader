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

  # comment the lines below if you want to see
  # the specs passing.
  def city
    dataloader
      .with(Sources::ActiveRecordObject, City)
      .load(object.city_id)
  end
end
