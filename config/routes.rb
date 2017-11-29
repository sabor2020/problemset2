Rails.application.routes.draw do
  post 'basics/quotations'
  get 'basics/quotations'

  root "basics#quotations"

  resources "basics"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
