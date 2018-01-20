class RestCaller
  attr_reader :method, :url, :header, :params

  def initialize(method, url, header, params = {})
    @method = method
    @url = url
    @header = header
    @params = params
  end

  def call
    parse_response
  end

  private

  def parse_response
    JSON.parse(response)
  end

  def response
    send(method.downcase)
  end

  def get
    RestClient.get(url, headers)
  end

  def post
    RestClient.post url, params.to_json, header
  end

  def delete
    RestClient.delete url
  end
end