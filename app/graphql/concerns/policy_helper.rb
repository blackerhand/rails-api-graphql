module PolicyHelper
  extend ActiveSupport::Concern

  module ClassMethods
    def owner_required!(args, ctx)
      login_required!(args, ctx)
      raise UnauthorizedError, :not_allow_disabled unless args[:node].try(:owner) == ctx[:current_user]

      true
    end

    def login_required!(_args, ctx)
      raise UnauthorizedError, :must_be_logged_in if ctx[:current_user].blank?

      true
    end

    def enabled_required!(args, _ctx)
      raise ActiveRecord::RecordNotFound.new("Couldn't find #{args[:node].class} with 'id'=#{args[:node].try(:id)}", args[:node].class) if args[:node].try(:disabled?)

      true
    end
  end
end
