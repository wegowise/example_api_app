class WegowiseClient
  RequestEror = Class.new(StandardError)

  class << self
    def oauth_key
      ENV.fetch('OAUTH_KEY')
    end

    def oauth_secret
      ENV.fetch('OAUTH_SECRET')
    end

    def token
      ENV.fetch('TOKEN')
    end

    def token_secret
      ENV.fetch('TOKEN_SECRET')
    end

    def base_url
      ENV.fetch('BASE_URL')
    end

    def consumer
      OAuth::Consumer.new(oauth_key, oauth_secret, site: base_url)
    end

    def client
      OAuth::AccessToken.new(consumer, token, token_secret)
    end

    def get(url)
      resp = client.get(url)

      if resp.code.to_i == 200
        Oj.load(resp.body)
      else
        raise RequestEror, resp.message unless resp.code == 200
      end
    end
  end
end
