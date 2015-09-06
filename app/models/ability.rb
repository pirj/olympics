class Ability
  include CanCan::Ability

  def initialize(user)
    self.send(user.role)
  end

# 1. Пользователи роли «Системный администратор» получают доступ на выполнение
# следующих задач:
# Управление учетными записями пользователей Портала;
# Назначение роли;
# Управление классификатором типов внешних мероприятий.

# 2. Пользователи ролей «Администрация КО», «Администрация ЦО» и
# «Администрация КНВШ» получают доступ на выполнение следующих задач:
# Управление

# 1 всеми созданными мероприятиями КО или КНВШ соответственно;
# Изменение ответственного за проведение мероприятия;
# Управление списком новостей КО и КНВШ соответственно;
# Управление классификатором предметов КО и КНВШ соответственно;
# Управление классификатором типов мероприятий КО и КНВШ соответственно;
# Управление предполагает доступ к операциям создания, редактирования, просмотра и удаления
# Управление перечнем внешних событий;
# Ответы на вопросы посетителей Портала, сформированные через страницу
# «Вопросы и ответы»;
# Создание анкет для проведения анкетирования посетителей Портала.

# 3. Пользователь КО, ЦО и Пользователь КНВШ
# Управление мероприятиями, автором которых является пользователь (КО, ЦО или
# КНВШ соответственно);
# Управление списком новостей КО и КНВШ соответственно;

# 4. Пользователь внешней организации
# Роль предназначена для предоставления доступа пользователям к закрытой части
# Портала в режиме «Только для чтения».

protected
  # TODO: refactor to classes (with canard gem?)
  def sys_admin
    can :manage, :all
  end

  def ko_admin
  end

  def knvsh_admin
  end

  def tso_admin
  end

  def ko_user
  end

  def knvsh_user
  end

  def tso_user
  end

  def external_user
    can :read, :all
  end

  def none
    can :read, :News
  end
end
