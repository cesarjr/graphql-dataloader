class Resolvers::GetPeopleResolver < GraphQL::Schema::Resolver
  description 'Get a list of people.'

  type [Types::Person], null: false

  def resolve
    Person.order(:name)
  end
end
