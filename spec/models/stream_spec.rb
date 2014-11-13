require 'rails_helper'

describe Stream do
  it do
    should ensure_length_of(:streamer).
      is_at_least(4).is_at_most(255).
      with_message('В названии стрима должно быть от 4 до 255 символов.')
  end

  it do
    should ensure_length_of(:channel).
      is_at_least(4).is_at_most(255).
      with_message('В названии канала должно быть от 4 до 255 символов.')
  end
end
