defmodule ElixirServy.Handler do
  def handle(a_request) do
    a_request
    |> parse
    |> route
    |> format_response
  end

  def parse(a_request) do
    conv = %{ method: 'GET', path: '/wildthings', resp_body: '' }
  end

  def route(a_conv) do
    conv = %{ method: 'GET', path: '/wildthings', resp_body: 'Bears, Lions, Tigers' }
  end

  def format_response(a_conv) do
    """
    HTTP/1.1 200 OK
    Content-Type: text/html
    Content-Length: 20

    Bears, Lions, Tigers
    """
  end
end

request = """
GET /wildthings HTTP/1.1
Host: example.com
User-Agent: ExampleBrowser/1.0
Accept: */*

"""

response = ElixirServy.Handler.handle(request)

IO.puts response
