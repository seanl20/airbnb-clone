module Repositories
  class ProfileRepo
    def get(id:)
      Profile.find(id)
    end
  end
end