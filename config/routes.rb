ShareSpace::Engine.routes.draw do
  root "canvases#index"
  resources :canvases do
    resources :elements, controller: "canvas_elements", only: %i[create update destroy]
  end
end
