module SimpleSpamPrevent
  module ApplicationHelper
    include SimpleCaptcha::ControllerHelpers

    def prevent_spam_from(klass, max_times, interval)
      return if captcha_already_cleared
      current_entity = self.send("current_#{klass.to_s}".to_sym)
      return if current_entity == nil
      prevent_spam(current_entity.class.to_s.to_sym, current_entity.id, max_times, interval)
    end

    def prevent_spam(current_class, current_id, max_times, interval)
      return if current_class.nil? || current_id.nil?
      return if captcha_already_cleared
      controller = params[:controller]
      action = params[:action]
      ActionHistory.create!(controller: controller, action: action, reference_type: current_class, reference_id: current_id)
      if is_spam?(controller, action, current_class, current_id, max_times, interval)
          session[:store_params] = params
          redirect_to simple_spam_prevent.show_captcha_path and return
      end
    end

    def captcha_already_cleared
      if session.try(:[], :simple_spam_prevent).try(:[], :captcha_cleared) == true
        session[:simple_spam_prevent][:captcha_cleared] = false
        params.merge!(session[:store_params].with_indifferent_access.except(:authenticity_token))
        session[:store_params] = nil
        return true
      end
      return false
    end

    def is_spam?(controller, action, current_class, current_id, max_times, interval)
      count = ActionHistory.where("controller = (?) AND action = (?) AND created_at > (?) AND reference_type = (?) AND reference_id = (?)", controller, action, Time.now - interval, current_class, current_id).count
      puts "------------------------------------------------#{count} #{max_times} #{count > max_times}"
      return count > max_times
    end

  end
end
