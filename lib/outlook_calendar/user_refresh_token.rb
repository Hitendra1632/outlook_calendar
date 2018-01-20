class UserRefreshToken
  attr_reader :token, :refresh_token, :client_id, :client_secret, :redirect_uri

  def initialize(token, refresh_token, client_id, client_secret, redirect_uri)
    @token = token
    @refresh_token = refresh_token
    @client_id = client_id
    @client_secret = client_secret
    @redirect_uri = redirect_uri
  end

  def call
    parse_response
  end

  private

  def parse_response
    {
      access_token: response['access_token'],
      refresh_token: response['refresh_token']
    }
  end

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
      refresh_token: refresh_token,
      redirect_uri: redirect_uri,
      client_id: client_id,
      client_secret: client_secret,
      grant_type: 'refresh_token'
    }
  end

  def url
    'https://login.live.com/oauth20_token.srf'
  end
end