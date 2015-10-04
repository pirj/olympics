module CaseSensivity
  LIKE = 'ILIKE' if Rails.env.production?
  LIKE = 'LIKE' unless Rails.env.production?
end
