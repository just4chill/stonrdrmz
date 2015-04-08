Rails.application.routes.draw do
  
  root 					"home#index"
  get	"help"		=>	"home#help"
  get	"about"		=>	"home#about"
  get	"contact"	=>	"home#contact"

  resources	:post
  
end
