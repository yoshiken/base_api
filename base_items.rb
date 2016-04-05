require 'net/http'
require 'json'
require './base_token'

request_parameters =
  { grant_type:    AUTHORIZATION_CODE,
    client_id:     CLIENT_ID,
    client_secret: CLIENT_SECRET,
    code:          CODE,
    redirect_uri:  REDIRECT_URI }

  uri =
    URI.join(
      API_HOST,
      "/#{API_VERSION}/oauth/token/")

    response =
      Net::HTTP.post_form(uri, request_parameters)


    parsed_response =
      JSON.parse response.body


    p parsed_response

    token=parsed_response["access_token"]

    header_parameters =
      { 'Authorization' => "Bearer #{token}" }

request_parameters =
  { 'order'  => 'created',
    'sort'   => 'desc',
    'limit'  => '10',
    'offset' => '0' }

uri =
  URI([
    API_HOST,
    "/#{API_VERSION}/items/?",
    URI.encode_www_form(request_parameters)]
      .join)

request =
  Net::HTTP::Get.new(
    uri,
    header_parameters)

response =
  Net::HTTP.start(
    uri.hostname,
    uri.port,
    use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

parsed_response =
  JSON.parse response.body

p parsed_response
