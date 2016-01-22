Rails.application.routes.draw do
  get '/', to: redirect('/en')
  get '/sites', to: 'protected_areas#index', as: 'protected_areas'

  # API      👇
  namespace :api do
    resources :protected_areas, only: [:index, :show]
    get '/protected_areas/:id/vulnerability', to: 'protected_areas#vulnerability', as: 'vulnerability'
    get '/protected_areas/:id/suitability_changes', to: 'protected_areas#suitability_changes', as: 'suitability_changes'
  end

  # Protected Areas
  constraints(id: /\d+/) do
    get '/:id', to: 'protected_areas#show', as: 'protected_area'
    get '/download/:id', to: 'protected_areas#download', as: 'download'

    # Tables Partials
    get '/:id/vulnerability_table', to: 'protected_areas#vulnerability_table', as: 'vulnerability_table'
    get '/:id/suitability_changes_table', to: 'protected_areas#suitability_changes_table', as: 'suitability_changes_table'
  end

  comfy_route :cms_admin, :path => '/admin'
  comfy_route :cms, :path => '/', :sitemap => false
end
