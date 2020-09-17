# Services 层
module Svc
  class Base
    def self.call(*args)
      new(*args).call
    end

    def call
      raise NotImplementedError
    end
  end
end
