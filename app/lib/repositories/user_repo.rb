module Repositories
  class UserRepo
    def get(id:)
      User.find(id)
    end
  end
end