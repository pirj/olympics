class EventDecorator < Draper::Decorator
  delegate_all

  def longevity
    if object.start == object.finish
      I18n.t(:single_day, scope: 'activerecord.attributes.event.longevity')
    elsif object.start.month == object.finish.month
      I18n.t(:period, scope: 'activerecord.attributes.event.longevity', start: object.start.day, finish: I18n.l(object.finish, format: :noyear))
    elsif object.start.year == object.finish.year
      I18n.t(:period, scope: 'activerecord.attributes.event.longevity', start: I18n.l(object.start, format: :noyear), finish: I18n.l(object.finish, format: :noyear))
    else
      I18n.t(:period, scope: 'activerecord.attributes.event.longevity', start: I18n.l(object.start), finish: I18n.l(object.finish))
    end
  end
end
