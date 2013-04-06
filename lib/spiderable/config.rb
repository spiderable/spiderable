module Spiderable
  module Config
    attr_accessor :token

    extend self

    def map
      yield self
    end
  end
end