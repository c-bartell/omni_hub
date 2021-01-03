class OmniAuthFacade
  class << self
    def access_token(code)
      OmniAuthService.request_token(code)[:access_token]
    end
  end
end
