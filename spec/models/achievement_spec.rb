require 'rails_helper'

describe Achievement do
  it { should belong_to(:user) }
end
