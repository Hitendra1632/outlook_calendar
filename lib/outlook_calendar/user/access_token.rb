module OutlookCalendar
  class AccessToken
    attr_reader :code, :client_id, :client_secret, :scope, :redirect_uri

    def initialize(code, client_id, client_secret, scope, redirect_uri)
      @code = code
      @client_id = client_id
      @client_secret = client_secret
      @scope = scope
      @redirect_uri = redirect_uri
    end

    def call
      response
    end

    private

    def response
      caller
    end

    def caller
      RestCaller.new('post', url, headers, attributes).call
    end

    def headers
      {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    end

    def attributes
      {
        code: code,
        client_id: client_id,
        client_secret: client_secret,
        scope: scope,
        redirect_uri: redirect_uri,
        grant_type: 'authorization_code'
      }
    end

    def url
      'https://login.microsoftonline.com/common/oauth2/v2.0/token'
    end
  end
end
