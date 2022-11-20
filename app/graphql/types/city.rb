class Types::City < Types::BaseObject
  field :id, ID,
        null: false

  field :name, String,
        null: false,
        description: 'Name.'

  field :state, String,
        null: false,
        description: 'State.'
end
