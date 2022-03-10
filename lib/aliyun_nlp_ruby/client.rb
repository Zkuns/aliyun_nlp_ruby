require 'erb'
require 'uuid'
require 'json'
require 'openssl'
require 'base64'
require 'faraday'

module AliyunNlpRuby
  class Client
    SERVICE_URL = "http://alinlp.cn-hangzhou.aliyuncs.com"

    def send_request params
      params_without_sig = build_params(params.merge(intrinsic_params))
      params_full= "Signature=#{sign(params_without_sig)}&#{params_without_sig}"

      response = Faraday.get "#{SERVICE_URL}?#{params_full}"
      if response != 200 && defined? Rails
        Rails.logger.error(response.body)
      end
      data = JSON.parse(response.body).dig('Data') || ''
      JSON.parse(data).dig('result')
    end

    private

    def build_params(hash)
      hash.map{|k,v|"#{encode(k.to_s)}=#{encode(v.to_s)}"}.sort.join('&')
    end

    def encode(str)
      ERB::Util.url_encode str
    end

    def sign(str)
      str = "GET&#{encode('/')}&#{encode(str)}"
      ret = OpenSSL::HMAC.digest('sha1', "#{AliyunNlpRuby.configuration.access_key_secret}&", str)
      ret = Base64.encode64(ret)
      encode(ret.chomp)
    end

    def timestamp
      Time.now.utc.strftime("%FT%TZ")
    end

    def nonce
      UUID.generate
    end

    def intrinsic_params
      configuration = AliyunNlpRuby.configuration
      {
        :AccessKeyId => configuration.access_key_id,
        :Format => configuration.format,
        :SignatureMethod => configuration.signature_method,
        :SignatureVersion => configuration.signature_version,
        :Timestamp => timestamp,
        :SignatureNonce => nonce,
        :Version => configuration.version,
        :ServiceCode => configuration.service_code,
        :TokenizerId => configuration.tokenizer_id,
      }
    end
  end
end
