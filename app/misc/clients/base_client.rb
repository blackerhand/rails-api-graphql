module Clients
  class BaseClient < HttpStore::Client
    include Clients::Concerns::Format
  end
end
