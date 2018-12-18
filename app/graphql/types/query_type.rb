Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allLinks, function: Resolvers::LinksSearch

  field :allUsers, !types[Types::UserType] do
    # resolve would be called in order to fetch data for that field
    resolve -> (obj, args, ctx) { User.all }
  end
end
