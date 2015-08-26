require 'rails_helper'

describe Page do
  it do
    should ensure_length_of(:title)
      .is_at_least(2).is_at_most(20)
      .with_message('В названии страницы должно быть от 2 до 20 символов.')
  end

  it do
    should ensure_length_of(:content_ru)
      .is_at_most(3_000)
      .with_message('Контент на русском должен быть не больше 3000 символов.')
  end

  it do
    should ensure_length_of(:content_en)
      .is_at_most(3_000)
      .with_message('Контент на английском должен быть не больше 3000 символов.')
  end
end
