require 'aliyun_nlp_ruby/client'
require 'aliyun_nlp_ruby/configuration'

module AliyunNlpRuby
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def get_ws_ch_general text, out_type = 1
      params = {
        Action: 'GetWsChGeneral',
        Text: text,
        OutType: out_type
      }
      client.send_request(params)
    end

    def get_pos_ch_general text, out_type = 1
      params = {
        Action: 'GetPosChGeneral',
        Text: text,
        OutType: out_type
      }
      client.send_request(params)
    end

    def query action, custom_params
      params = { Action: action }
      client.send_request(params.merge(custom_params))
    end

    private
    def client
      @client ||= AliyunNlpRuby::Client.new
    end
  end
end
