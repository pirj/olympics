module Questionnaires
  extend ActiveSupport::Concern

  included do
    attr_reader :questionnaires
    helper_method :questionnaires

    before_filter do
      @questionnaires = Questionnaire.active
    end

    before_filter only: :answer do
      @answer = Answer.find params[:id]
    end

    def answer
      # FIXME: is there a way to avoid adding /answer to url
      # redirect_to reloads the whole page
      fail unless @questionnaires.include? @answer.question.questionnaire
      unless answer_to @answer.question
        answer! @answer
        Vote.create answer: @answer
      end
      render :index
    end

  protected
    # FIXME don't like explicit to_s, but ids are serialized to strings
    def answer_to question
      session_data(:answered)[question.id.to_s]
    end
    helper_method :answer_to

    def answer! answer
      session_data(:answered)[answer.question.id.to_s] = answer.id
    end

  private
    def session_data key
      session[key] ||= {}
    end
  end
end
