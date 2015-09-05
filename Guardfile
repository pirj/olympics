guard :shell do
  watch('Gemfile') { system 'bundle' }

  watch(/db\/migrate/) {
    system 'spring rake db:migrate'
    system 'spring rake db:migrate RAILS_ENV=test'
  }
end
