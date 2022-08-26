module Types
  class MutationType < Types::BaseObject
    include SmartMutation

    # users
    smart_mutation :'users/sign_in'
    smart_mutation :'users/sign_up'
    smart_mutation :'users/update'
  end
end
