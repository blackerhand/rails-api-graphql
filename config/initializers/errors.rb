class SignError < GraphQL::ExecutionError; end

class PermissionDeniedError < StandardError; end

class RecordStateError < StandardError; end

class RecordAlreadyDisabled < StandardError; end

class RecordNotAllowDisabled < StandardError; end

class RecordCheckInvalid < StandardError; end

class SearchError < StandardError; end
