Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin_oauth2,'jv7vegev5ppb','yUnErcFYeqSTPagi', :scope => 'r_fullprofile r_emailaddress r_network'
end