require 'rails_helper'

describe Video do
  it do
    should ensure_length_of(:title)
      .is_at_least(4).is_at_most(255)
      .with_short_message('В названии видео должно быть не меньше 4 символов.')
      .with_long_message('В названии видео должно быть не больше 255 символов.')
  end

  it do
    should ensure_length_of(:youtube_hash)
      .is_equal_to(11)
      .with_message('Идентификатор видео на Youtube должен состоять из 11 символов.')
  end
end
