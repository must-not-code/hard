def send_email(username, email, type)
  case type
    when 'signup'
      message = "Приветствуем #{username},\n\nВы были успешно зарегистрированы на HardRandom.com\n\nС уважением,\nкоманда HardRandom.com"
  end
  Pony.mail(
    :to       => email,
    :headers  => {'From' => 'HardRandom.com <info@hardrandom.com>'},
    :subject  => 'Регистрация на HardRandom.com',
    :body     => message,
    :charset  => 'utf-8')
end
