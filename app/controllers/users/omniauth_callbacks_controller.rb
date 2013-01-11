class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def twitter
    # You need to implement the method below in your model
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    token = request.env["omniauth.auth"]["credentials"]["token"]
    secret = request.env["omniauth.auth"]["credentials"]["secret"]
    session["token"] = token
    session["secret"] = secret
    Twitter.configure do |config|
      config.consumer_key = Devise::omniauth_configs[:twitter].strategy["consumer_key"]
      config.consumer_secret = Devise::omniauth_configs[:twitter].strategy["consumer_secret"]
    end
    @client = Twitter::Client.new(
      :oauth_token => token,
      :oauth_token_secret => secret
    )
    #binding.pry
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
