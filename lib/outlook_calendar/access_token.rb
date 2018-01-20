class AccessToken
  attr_reader :code, :app_id, :app_secret_key, :scope, :redirect_uri

  def initialize(code, app_id, app_secret_key, scope, redirect_uri)
    @code           = code
    @app_id         = app_id
    @app_secret_key = app_secret_key
    @scope          = scope
    @redirect_uri   = redirect_uri
  end

  def call
    access_token
  end

  private

  def access_token
    user_token_response.token
  end

  def oauth_client
    @oauth_client = OAuth2::Client.new(app_id,
                                       app_secret_key,
                                       site: 'https://login.microsoftonline.com',
                                       authorize_url: '/common/oauth2/v2.0/authorize',
                                       token_url: '/common/oauth2/v2.0/token')
  end

  def user_token_response
    @user_token_response = @oauth_client.auth_code.get_token(code,
                                                             redirect_uri: redirect_uri,
                                                             scope: scope)
  end

end