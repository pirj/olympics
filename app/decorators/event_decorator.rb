class EventDecorator < Draper::Decorator
  delegate_all

  def longevity
    object.created_at.strftime("%a %m/%d/%y")
# Длительность: 1 день</span>
          # <span>Длительность: с 15-18 января</span>
  end
end
