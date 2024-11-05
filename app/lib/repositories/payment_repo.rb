module Repositories
  class PaymentRepo
    def create(attrs:, monetize_attrs:)
      Payment.create!(Payments::Changesets::Create.map(attrs).merge(monetize_attrs))
    end
  end
end