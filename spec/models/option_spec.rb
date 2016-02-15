require 'rails_helper'

describe Option, type: :model do
  it { is_expected.to belong_to :idea }
end
