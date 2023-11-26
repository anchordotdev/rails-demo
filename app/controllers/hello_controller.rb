class HelloController < ApplicationController
  require 'uri'

  def index
    if backend?
      @backend_url = ENV.fetch('BACKEND_URL')
      @backend_resp = ping_backend
    end
  end

  def backend?
    ENV.key?('BACKEND_URL')
  end
  helper_method :backend?

  def ping_backend
    backend_hostname, backend_port, backend_path = parse_backend_url
    client = Net::HTTP.start(backend_hostname, backend_port, use_ssl: true, cert_store: Anchor.cert_store)
    return client.get(backend_path).body
  end

  def parse_backend_url
    uri = URI.parse(ENV.fetch('BACKEND_URL'))
    return uri.hostname, uri.port, uri.path
  end
end
