# AliyunNlpRuby
阿里云的分词服务SDK

## 安装

```ruby
gem 'aliyun_nlp_ruby'
```

## 配置
添加文件 aliyun_nlp_ruby.rb 到 config/initializers.

```ruby
AliyunNlpRuby.configure do |config|
  config.access_key_secret = ENV['ALIYUN_NLP_ACCESS_KEY_SECRET']
  config.access_key_id = ENV['ALIYUN_NLP_ACCESS_KEY_ID']
end
```

## 使用

### 中文分词
文档地址: https://help.aliyun.com/document_detail/181284.html

``` ruby
result = AliyunNlpRuby.get_ws_ch_general('对阿里云的分词进行调用')
put result
```

### 词性标注
文档地址: https://help.aliyun.com/document_detail/177225.html

``` ruby
result = AliyunNlpRuby.get_pos_ch_general('对阿里云的词性标注进行调用')
put result
```

### 通用方法

``` ruby
#进行分词调用
AliyunNlpRuby.query 'GetWsChGeneral', { Text: '对阿里云的分词进行调用', OutType: 1 }
```
