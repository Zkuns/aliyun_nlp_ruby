module AliyunNlpRuby
  class Configuration
    attr_accessor :access_key_secret, :access_key_id, :format, :region_id,
                  :signature_method, :signature_version, :version, :service_code,
                  :tokenizer_id

    def initialize
      @access_key_secret = ''
      @access_key_id = ''
      @format = 'JSON'
      @signature_method = 'HMAC-SHA1'
      @signature_version = '1.0'
      @version = '2020-06-29'
      @service_code = 'alinlp'
      @tokenizer_id = 'GENERAL_CHN'
    end
  end
end
