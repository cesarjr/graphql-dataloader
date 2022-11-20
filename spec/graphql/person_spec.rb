require 'rails_helper'

RSpec.describe Types::Person do
  it 'returns the fields in the same order as required' do
    city1 = City.create(name: 'Rio Branco', state: 'Acre')
    city2 = City.create(name: 'Maceió', state: 'Alagoas')
    city3 = City.create(name: 'Macapá', state: 'Amapá')

    seller1 = Seller.create(name: 'John')
    seller2 = Seller.create(name: 'David')
    seller3 = Seller.create(name: 'Erika')

    person1 = Person.create(name: 'Ashley', city: city1, seller: seller1)
    person2 = Person.create(name: 'Carl', city: city2, seller: seller2)
    person3 = Person.create(name: 'Robert', city: city3, seller: seller3)

    query = <<~GQL
      query {
        getPeople {
          id
          name
          city {
            id
            name
            state
          }
          seller {
            id
            name
          }
        }
      }
    GQL

    expected = JSON.pretty_generate({
      data: {
        getPeople: [
          {
            id: person1.id.to_s,
            name: 'Ashley',
            city: {
              id: city1.id.to_s,
              name: 'Rio Branco',
              state: 'Acre'
            },
            seller: {
              id: seller1.id.to_s,
              name: 'John'
            }
          },
          {
            id: person2.id.to_s,
            name: 'Carl',
            city: {
              id: city2.id.to_s,
              name: 'Maceió',
              state: 'Alagoas'
            },
            seller: {
              id: seller2.id.to_s,
              name: 'David'
            }
          },
          {
            id: person3.id.to_s,
            name: 'Robert',
            city: {
              id: city3.id.to_s,
              name: 'Macapá',
              state: 'Amapá'
            },
            seller: {
              id: seller3.id.to_s,
              name: 'Erika'
            }
          }
        ]
      }
    })

    result = JSON.pretty_generate(
      GraphqlDataloaderSchema.execute(
        query, context: {}, variables: {}
      )
    )

    expect(result).to eql expected
  end
end
