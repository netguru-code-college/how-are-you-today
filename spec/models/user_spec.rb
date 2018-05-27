require 'rails_helper'

describe User, type: :model do
  describe 'document' do
    context 'validations' do
      it { is_expected.to validate_presence_of(:email) }
    end
  end

  let(:user) { build(:user) }

  it 'is databse authenticable' do
    expect(user.valid_password?('password')).to be_truthy
  end
end
