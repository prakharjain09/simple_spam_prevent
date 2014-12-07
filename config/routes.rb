SimpleSpamPrevent::Engine.routes.draw do

	match '/show_captcha', to: "captcha#show_captcha", via: [:get]
	match '/verify_captcha', to: "captcha#verify_captcha", via: [:get, :post]

end
