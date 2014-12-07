class ApplicationController < ActionController::Base
	include SimpleSpamPrevent::ApplicationHelper
  protect_from_forgery

	before_filter(only: [:abc]) { prevent_spam(:user, 1, 3, 100.second) }

  def abc
		@message = params[:my_form].try(:[], :message)
  end

  def current_user
  	return 1
  end

end