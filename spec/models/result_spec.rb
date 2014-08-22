require 'rails_helper'

describe Result do
  it { should belong_to(:user) }
  it { should belong_to(:tournament) }

  it do
    should ensure_length_of(:content).
      is_at_least(4).is_at_most(3000).
      with_short_message('Ваш комментарий недостаточно информативен.').
      with_long_message('Недопустимое количество символов.')
  end
end
