require 'base'
require 'coinbase'

module Api
  class Wrapper < Base
    %w[
      coinbase
      coin_gecko
      coin_paprika
    ].each do |api|
      define_method(api.to_sym) do
        Object.const_get("Api::#{klassify(api)}")
      end
    end

    def klassify(name)
      name.split('_').collect(&:capitalize).join
    end
  end
end
