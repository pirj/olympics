guard :shell do
  watch('Gemfile') { system 'bundle' }

  watch(/db\/migrate/) {
    system 'spring rake db:drop db:migrate db:seed'
    system 'spring rake db:drop db:migrate db:seed RAILS_ENV=test'
  }
end

guard :livereload, grace_period: 2 do
  watch(%r{app/views/.+\.(erb|haml|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
end
