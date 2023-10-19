require 'anchor-pki'

Rails.application.configure do
  # Specify a name when your app uses multiple certificates provisioned
  # by an Anchor::AutoCert::Manager, for example when using mTLS in a
  # client and TLS from the rails application.
  #
  # The value here needs to be the same as the value used in the
  # `config/puma.rb` file.
  # config.auto_cert.name = 'rails'

  # Specify an acceptor or an array of acceptors for a CA's Terms of Service
  # (TOS). The acceptor must be an object that responds to `accept?(tos_uri)`
  # with a boolean response. The argument will be the URI (as a String) of the
  # CA's Terms of Service.
  #
  # There are two built-in acceptors: the Any acceptor and the Regex acceptor
  # You are welcome to create your own Acceptor class; Inheriting from
  # `::Anchor::AutoCert::TermsOfServiceAcceptor` and implementing the
  # `accept?(tos_uri)` method is all that is required.
  #
  # config.auto_cert.tos_acceptor = [
  #   Anchor::AutoCert::TermsOfServiceAcceptor::Regex.new(/letsencrypt\.org/),
  #   Anchor::AutoCert::TermsOfServiceAcceptor::Regex.new(/buypass\.com/)
  # ]
  config.auto_cert.tos_acceptors = Anchor::AutoCert::TermsOfServiceAcceptor::Any.new

  # Set the length of time to renew and replace certificates prior to
  # certificate expiry. This can be configured as the number of seconds before
  # expiration, or as a fraction of the time left before expiration.
  #
  # Both can be set, the earliest value will be used.
  #
  config.auto_cert.renew_before_seconds = 7.days  # when 7 days are left before expiration
  # config.auto_cert.renew_before_fraction = 0.5  # when 50% of the time is left before expiration

  # Store certificates, keys, and account keys in a cache object to avoid
  # re-provisioning certificates unless necessary. The cache object must
  # respond to read, write, and fetch.
  #
  # Unless specified, an `ActiveSupport::Cache::FileStore` is used with the
  # `./tmp/acme/cache` local directory.
  #
  # config.auto_cert.cache = ActiveSupport::Cache::FileStore.new('./tmp/acme/cache')

  # A working directory is necessary for storing temporary files during the
  # certificate provisioning process. The working directory must be writable
  # by the process running the rails application.
  #
  # Unless specified, the `./tmp/acme/work` local directory is used.
  #
  # config.auto_cert.work_dir = './tmp/acme/work'
end


