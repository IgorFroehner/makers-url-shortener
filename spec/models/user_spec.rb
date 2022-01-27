require 'rails_helper'

RSpec.describe User, type: :model do
  describe ':email' do
    let(:user) { described_class.new(password_digest: "1234") }

    context 'with valid emails' do
      valid_email_list = ['igor@maker.com', 'valid.valid@valid.com', 'again_valid@valid.com.br']

      valid_email_list.each do |email|
        it 'considers the entity valid' do
          user.email = email
          expect(user).to be_valid, "considered '#{email}' a invalid email format"
        end
      end
    end

    context 'with invalid emails' do
      invalid_email_list = ['@maker.com', 'asdf@.com', 'now_invalid@valid', 'valid@', '@', '@invalid', '.com']

      invalid_email_list.each do |email|
        it 'considers the entity invalid' do
          user.email = email
          expect(user).to be_invalid, "considered '#{email}' a valid email format"
        end
      end
    end
  end
end
