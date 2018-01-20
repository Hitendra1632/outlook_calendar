class Calenders
  attr_reader :token, :token_expires_at, :user_agent

  def initialize(token, token_expires_at, user_agent = {})
    @token = token
    @token_expires_at = token_expires_at
    @user_agent = user_agent
  end

  def call
    calenders
  end

  private

  def calenders
    ParseResponse.new(caller).call
  end


  def caller
    RestCaller.new('get', url, headers).call
  end

  def headers
    {
      'Authorization' => "Bearer #{token.token}",
      'Accept' => 'application/json',
      'User-Agent' => user_agent
    }
  end

  def token_valid?
    Time.now < Time.at(token_expires_at)
  end

  def url
    @url = 'https://outlook.office365.com/api/v2.0/me/calendars'
  end
end