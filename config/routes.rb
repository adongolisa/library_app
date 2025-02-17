Rails.application.routes.draw do
    resources :books do
          member do
                  post 'borrow', to: 'borrowings#create', as: 'borrow'
                        patch 'return', to: 'borrowings#return_book', as: 'return'
                              get 'history', to: 'borrowings#borrower_history', as: 'history'
                                  end
            end
end

