class CallApi < ApplicationService
  def call
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex[:publishable_token],
      secret_token: Rails.application.credentials.iex[:secret_token],
      endpoint: 'https://sandbox.iexapis.com/stable'
    )
  end
end