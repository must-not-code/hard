require 'rails_helper'

describe Post do
  it { should belong_to(:user) }
  it { should have_many(:comments) }

  it do
    should ensure_length_of(:title).
      is_at_least(2).is_at_most(255).
      with_message('Посту нужен заголовок адекватной длины!')
  end

  it do
    should ensure_length_of(:game).
      is_at_least(2).is_at_most(24).
      with_message('Пост должен относиться к какой-то игре!')
  end

  it do
    should ensure_length_of(:content).
      is_at_least(140).is_at_most(30000).
      with_short_message('Это вам не твиттер!').
      with_long_message('Слишком многа букаф!!!111')
  end
end
