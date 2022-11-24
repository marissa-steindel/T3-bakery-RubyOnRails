# executed when the server starts up

# rails configuration object, with stripe attribute
# environment variables (operating system level) are pulled in during run-time
Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY'],
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# start the server with temp environment variable secret and publishable keys
# PUBLISHABLE_KEY=pk_test_A7jK4iCYHL045qgjjfzAfPxu SECRET_KEY=sk_test_Hrs6SAopgFPF0bZXSN3f6ELN rails s
