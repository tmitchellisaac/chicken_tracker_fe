class AnimalDecorator < Draper::Decorator
  delegate_all

  def formatted_birthday
    object.birthday.to_date.strftime('%B %d, %Y')
  end
end
