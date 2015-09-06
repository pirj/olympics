guard :shell do
  watch('Gemfile') { system 'bundle' }

  watch(/db\/migrate/) {
    system 'spring rake db:drop db:migrate db:seed'
    system 'spring rake db:drop db:migrate db:seed RAILS_ENV=test'
  }
end
