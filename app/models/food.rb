require "openssl"
require "base64"
require "digest/md5"
require "net/http"
require 'cgi'

class Food < ActiveRecord::Base
    # attr_accessible :title, :body

    KEY = '2858c7582362405f83adf083b332bde6'.freeze
    SECRET = '67e241faea4c4f6abdc48bd99edc4bb2'.freeze
    SHA1 = 'HMAC-SHA1'.freeze
    SITE = 'http://platform.fatsecret.com/rest/server.api'.freeze
    class String
        def esc
            CGI.escape(self).gsub('%7E', '~').gsub('+', '%20')
        end
    end
    def self.search(expression)
        params = {
            oauth_consumer_key: KEY,
            oauth_nonce: Digest::MD5.hexdigest(rand(11).to_s),
            oauth_signature_method: SHA1,
            oauth_timestamp: Time.now.to_i,
            oauth_version: '1.0',
            method: 'foods.search',
            format: 'json',
            search_expression: expression.esc
        }
        sorted_params = params.sort { |a, b| a.first.to_s <=> b.first.to_s }
        base = base_string('GET', sorted_params)
        http_params = http_params('GET', params)
        sig = sign(base).esc
        uri = uri_for(http_params, sig)
        results = Net::HTTP.get(uri)
    end
    def self.get(food_id)
        params = {
            oauth_consumer_key: KEY,
            oauth_nonce: Digest::MD5.hexdigest(rand(11).to_s),
            oauth_signature_method: SHA1,
            oauth_timestamp: Time.now.to_i,
            oauth_version: '1.0',
            method: 'food.get',
            food_id: food_id,
            format: 'json'
        }
        sorted_params = params.sort { |a, b| a.first.to_s <=> b.first.to_s }
        base = base_string('GET', sorted_params)
        http_params = http_params('GET', params)
        sig = sign(base).esc
        uri = uri_for(http_params, sig)
        results = Net::HTTP.get(uri)
    end

    def self.base_string(http_method, param_pairs)
        param_str = param_pairs.collect { |pair| "#{pair.first}=#{pair.last}" }.join('&')
        list = [http_method.esc, SITE.esc, param_str.esc]
        list.join('&')
    end

    def self.http_params(_method, args)
        pairs = args.sort { |a, b| a.first.to_s <=> b.first.to_s }
        list = []
        pairs.inject(list) { |arr, pair| arr << "#{pair.first}=#{pair.last}" }
        list.join('&')
    end

    def self.sign(base, token = '')
        secret = "#{SECRET.esc}&#{token.esc}"
        base64 = Base64.encode64(OpenSSL::HMAC.digest('sha1', secret, base)).delete("\n")
    end

    def self.uri_for(params, signature)
        parts = params.split('&')
        parts << "oauth_signature=#{signature}"
        URI.parse("#{SITE}?#{parts.join('&')}")
    end
end
