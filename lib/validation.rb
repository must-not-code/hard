def signup_validation(params)
  username_validation(params['username'])                             ||
  email_validation(params['email'])                                   ||
  password_validation(params['password'], params['password_confirm'])
end

def user_edit_validation(params)
  tag_validation(params['tag'])                                       ||
  skype_validation(params['skype'])                                   ||
  email_validation(params['email'])                                   ||
  about_validation(params['about'])
end

def username_validation(username)
  unless username.length.between?(3, 20)
    return 'Логин должен содержать от 3 до 20 символов.'
  end

  unless username[/^[a-zа-яё0-9]+([_\s\-]?[a-zа-яё0-9])+$/i]
    return 'Логин может содержать только латинские/русские буквы, цифры и символы (_- ) между ними.'
  end

  unless User.first(conditions: ["username ILIKE ?", username]).nil?
    return 'Пользователь с таким логином уже зарегистрирован.'
  end
end

def password_validation(password, password_confirm)
  unless password.length.between?(6, 20)
    return 'Пароль должен содержать от 6 до 20 символов.'
  end

  unless password == password_confirm
    return 'Пароли не совпадают.'
  end
end

def email_validation(email)
  unless @user.nil?
    return if @user.email.downcase == email.downcase
  end

  unless email[/^.+@.+\..+$/] && email.length.between?(6, 70)
    return 'Некорректный Email.'
  end

  unless User.first(conditions: ["email ILIKE ?", email]).nil?
    return 'Пользователь с таким Email уже зарегистрирован.'
  end
end

def tag_validation(tag)
  return if tag == ''
  return if @user.tag.downcase == tag.downcase

  unless tag[/^[a-zа-яё][a-zа-яё0-9]{2,11}#[0-9]{3,5}$/i]
    return 'Некорректный BattleTag.'
  end

  unless User.first(conditions: ["tag ILIKE ?", tag]).nil?
    return 'Пользователь с таким BattleTag уже зарегистрирован.'
  end
end

def skype_validation(skype)
  return if skype == ''
  return if @user.skype.downcase == skype.downcase

  unless skype[/^[a-z][a-z0-9\.,\-_]{5,32}$/i]
    return 'Некорректный Skype.'
  end

  unless User.first(conditions: ["skype ILIKE ?", skype]).nil?
    return 'Пользователь с таким Skype уже зарегистрирован.'
  end
end

def about_validation(about)
  return if about == ''

  if about.length < 3
    return 'Не скромничайте. Оставьте о себе больше трех букв.'
  end

  if about.length > 2000
    return 'Недопустимое количество символов.'
  end
end

def comment_validation(text)
  if text.length < 3
    return 'Ваш комментарий недостаточно информативен.'
  end

  if text.length > 5000
    return 'Недопустимое количество символов.'
  end
end
