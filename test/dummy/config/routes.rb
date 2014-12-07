Rails.application.routes.draw do
	match "/abc", to: "application#abc", via: [:get, :post]
  mount SimpleSpamPrevent::Engine => "/simple_spam_prevent", :as => 'simple_spam_prevent'
end
