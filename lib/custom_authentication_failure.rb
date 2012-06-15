  class CustomAuthenticationFailure < Devise::FailureApp 
  protected 
    def redirect_url 
#      "users/auth/facebook"
      root_path+"users/auth/facebook"
        #or whatever route in your app that points to '/' 
    end 
  end 