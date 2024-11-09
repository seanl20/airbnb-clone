module Repositories
  class ProfileRepo
    def get(id:)
      Profile.find(id)
    end

    def update(id:, attrs:)
      Profile
        .find(id)
        .update!(Profiles::Changesets::Update.map(attrs))
    end
  end
end