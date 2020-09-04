module GraphQL
  class ExecutionError
    def code
      406
    end

    # def to_h
    #   debugger
    #
    #   super.merge("code" => code)
    # end
  end
end
