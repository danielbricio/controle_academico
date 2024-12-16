Rails.application.routes.draw do

  root "home#index"
  resources :matriculas
    resources :alunos
  resources :disciplinas

   # Rota para exportar CSV combinado
  get 'exportar_csv', to: 'alunos#exportar_csv', as: 'exportar_csv'
  
end
