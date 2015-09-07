class WelcomeController < ApplicationController
  def index
    @questionnaires = Questionnaire.active
  end
end
