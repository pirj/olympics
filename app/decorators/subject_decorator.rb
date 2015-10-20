class SubjectDecorator < Draper::Decorator
  delegate_all

  def title
    super || I18n.t(:none)
  end
end
