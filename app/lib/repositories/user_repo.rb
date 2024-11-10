module Repositories
  class UserRepo
    def get(id:)
      User.find(id)
    end

    def get_by_email(email:)
      User.find_by!(email:)
    end

    def update(id:, attrs:)
      User
        .find(id)
        .update!(Users::Changesets::Update.map(attrs))
    end

    def update_password(id:, password:)
      User
        .find(id)
        .update!(password:)
    end
  end
end