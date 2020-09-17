module Types
  class MutationType < Types::BaseObject
    include SmartMutation

    # users
    smart_mutation :'user/sign_in'
    smart_mutation :'user/sign_up'

    # posts
    smart_mutation :'post/create'
    smart_mutation :'post/update'
  end
end
