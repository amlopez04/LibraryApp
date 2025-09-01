Rails.application.routes.draw do
  root "home#index"

  # Authors
  get    "/authors",          to: "authors#index",  as: "authors"
  get    "/authors/new",      to: "authors#new",    as: "new_author"
  post   "/authors",          to: "authors#create"
  get    "/authors/:id",      to: "authors#show",   as: "author"
  get    "/authors/:id/edit", to: "authors#edit",   as: "edit_author"
  patch  "/authors/:id",      to: "authors#update"
  delete "/authors/:id",      to: "authors#destroy"

  # Genres
  get    "/genres",          to: "genres#index",  as: "genres"
  get    "/genres/new",      to: "genres#new",    as: "new_genre"
  post   "/genres",          to: "genres#create"
  get    "/genres/:id",      to: "genres#show",   as: "genre"
  get    "/genres/:id/edit", to: "genres#edit",   as: "edit_genre"
  patch  "/genres/:id",      to: "genres#update"
  delete "/genres/:id",      to: "genres#destroy"

  # Books
  get    "/books",          to: "books#index",  as: "books"
  get    "/books/new",      to: "books#new",    as: "new_book"
  post   "/books",          to: "books#create"
  get    "/books/:id",      to: "books#show",   as: "book"
  get    "/books/:id/edit", to: "books#edit",   as: "edit_book"
  patch  "/books/:id",      to: "books#update"
  delete "/books/:id",      to: "books#destroy"

  # Reviews (nested for book on index/new/create)
  get    "/books/:book_id/reviews",     to: "reviews#index",  as: "book_reviews"
  get    "/books/:book_id/reviews/new", to: "reviews#new",    as: "new_book_review"
  post   "/books/:book_id/reviews",     to: "reviews#create"

  get    "/reviews/:id",        to: "reviews#show",   as: "review"
  get    "/reviews/:id/edit",   to: "reviews#edit",   as: "edit_review"
  patch  "/reviews/:id",        to: "reviews#update"
  delete "/reviews/:id",        to: "reviews#destroy"
end
