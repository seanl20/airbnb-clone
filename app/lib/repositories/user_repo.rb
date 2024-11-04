module Repositories
  class UserRepo
    def get(id:)
      User.find(id)
    end

    def get_by_email(email:)
      User.find_by!(email:)
    end

    def update(id:, attrs:)
      User.find(id).update!(attrs)
    end
  end
end