require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :ideas }
end
