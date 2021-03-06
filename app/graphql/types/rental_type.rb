Types::RentalType = GraphQL::ObjectType.define do
  interfaces [Types::ActiveRecordInterface]
  name "Rental"

  field :rental_type, !types.String
  field :accommodates, !types.Int
  field :bathrooms, !types.Int
  field :bedrooms, !types.Int
  field :beds, !types.Int
  field :nightly_cost, !types.Float
  field :description, types.String
  field :latitude, types.Float
  field :longitude, types.Float
  field :street1, !types.String
  field :street2, types.String
  field :city, !types.String
  field :province, types.String
  field :country, !types.String
  field :postal_code, types.String
  field :featured, types.Boolean
  field :views_count, types.Int

  field :owner, Types::UserType do
    preload :user
    resolve -> (obj, args, ctx) { obj.user if ctx[:current_user].blank? }
  end
  field :bookings, !types[Types::BookingType] do
    preload :bookings
    resolve -> (obj, args, ctx) { obj.bookings }
  end
end
