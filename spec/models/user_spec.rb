require 'rails_helper'

describe User do
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  it do
    should ensure_length_of(:username)
      .is_at_least(3).is_at_most(20)
      .with_message('Логин должен содержать от 3 до 20 символов.')
  end

  it do
    should validate_uniqueness_of(:username).case_insensitive
      .with_message('Пользователь с таким логином уже зарегистрирован.')
  end

  it do
    should allow_value('evil-penguin', 'Ёжик в тумане', 'pro_100_noob').for(:username)
  end

  it do
    should_not allow_value('_nogebator777_').for(:username)
      .with_message('В логине допустимы только буквы и цифры, а также пробел, дефис и нижнее подчеркивание между ними.')
  end

  it do
    should ensure_length_of(:email)
      .is_at_least(6).is_at_most(70)
      .with_message('Некорректная длина Email.')
  end

  it do
    should allow_value('jopa@mail.ru').for(:email)
  end

  it do
    should_not allow_value('jopamail.ru').for(:email)
      .with_message('Некорректный Email.')
  end

  it do
    should_not allow_value('jopa@mailru').for(:email)
      .with_message('Некорректный Email.')
  end

  it do
    should validate_uniqueness_of(:email).case_insensitive
      .with_message('Пользователь с таким Email уже зарегистрирован.')
  end

  it do
    should ensure_length_of(:password)
      .is_at_least(6).is_at_most(20)
      .with_message('Пароль должен содержать от 6 до 20 символов.')
  end

  it do
    should validate_confirmation_of(:password)
      .with_message('Пароли не совпадают.')
  end

  it do
    should validate_uniqueness_of(:skype).case_insensitive
      .with_message('Пользователь с таким Skype уже зарегистрирован.')
  end

  it do
    should allow_value('', 'h,a-r.d_random').for(:skype)
  end

  it do
    should_not allow_value('0lolol').for(:skype)
  end

  it do
    should ensure_length_of(:about)
      .is_at_least(3).is_at_most(3000)
      .with_short_message('Не скромничайте. Оставьте о себе больше трех букв.')
      .with_long_message('Недопустимое количество символов.')
  end

  it do
    should allow_value('', 'true story bro').for(:about)
  end

  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
end
