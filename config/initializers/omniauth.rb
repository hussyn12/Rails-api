OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '481648195798705', '49beed6273354cd2dfda7d6543786a1f', token_params: { parse: :json },
  scope: 'public_profile,email',
                info_fields: 'email,first_name,last_name',
                client_options: {
                    site: 'https://graph.facebook.com/v2.11',
                    authorize_url: "https://www.facebook.com/v2.11/dialog/oauth"
                }
    provider :twitter, "API_KEY", "API_SECRET"            
end