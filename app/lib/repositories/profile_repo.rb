module Repositories
  class ProfileRepo
    def get(id:)
      Profile.find(id)
    end

    def update(id:, attrs:)
      Profile
        .find(id)
        .update!(attrs)
    end
  end
end