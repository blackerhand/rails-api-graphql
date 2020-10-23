module Types
  class MutationType < Types::BaseObject
    include SmartMutation

    # users
    smart_mutation :'user/sign_in'
    smart_mutation :'user/sign_up'
  end
end
