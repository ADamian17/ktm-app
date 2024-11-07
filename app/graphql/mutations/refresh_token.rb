module Mutations
  class RefreshToken < BaseMutation
    argument :refresh_token, String, required: true

    field :access_token, String, null: true
    field :errors, [ String ], null: false

    def resolve(refresh_token:)
      user = User.find_by(refresh_token: refresh_token)

      if user && user.expires_at.future?
        { access_token: JwtService.encode({ user_id: user.id }), errors: [] }
      else
        { access_token: nil, errors: [ "Invalid or expired refresh token" ] }
      end
    end
  end
end
