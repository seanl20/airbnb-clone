require "rails_helper"

RSpec.describe Repositories::FavouritesRepo do
  describe "#delete" do
    subject(:create) { described_class.new.create(user_id:, property_id:) }

    context "creates favourite" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:property) { FactoryBot.create(:property) }

      let!(:user_id) { user.id }
      let!(:property_id) { property.id }

      it "is successful" do
        expect { create }.to change(Favourite, :count).by(1)
      end
    end
  end

  describe "#delete" do
    subject(:delete) { described_class.new.delete(favourite_id:) }

    context "deletes favourite" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:property) { FactoryBot.create(:property) }

      let!(:favourite) { FactoryBot.create(:favourite, user:, property:) }
      let!(:favourite_id) { favourite.id }

      it "is successful" do
        expect { delete }.to change(Favourite, :count).by(-1)
      end
    end
  end
end