module SimpleSpamPrevent
  class CaptchaController < SimpleSpamPrevent::ApplicationController
    def show_captcha
    end

    def verify_captcha
      if simple_captcha_valid?
        session[:simple_spam_prevent] = {} if session[:simple_spam_prevent].nil?
        session[:simple_spam_prevent][:captcha_cleared] = true
        redirect_to :controller => "/#{session[:store_params][:controller]}", :action =>session[:store_params][:action]
      else
        flash.now[:error] = "Incorrect Captcha"
        render "show_captcha"
      end
    end

  def url_for options=nil
    main_app.url_for options
  end



  end
end