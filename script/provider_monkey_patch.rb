begin
  RackReverseProxy::RoundTrip.instance_method(:headers)
rescue NameError => e
  raise "Could not find RackReverseProxy::RoundTrip#headers method to monkeypatch it. The implementation must have changed."
end

module RackReverseProxy
  class RoundTrip
    def headers
      Rack::Proxy.extract_http_request_headers(source_request.env).tap do | headers |
        headers["access_token"] = headers.delete("ACCESS-TOKEN")
      end
    end
  end
end
