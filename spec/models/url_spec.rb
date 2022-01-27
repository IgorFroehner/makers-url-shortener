require 'rails_helper'

RSpec.describe Url, type: :model do
  it 'doesnt save a Url with all invalid fields' do
    expect(described_class.new).not_to be_valid, 'Saved a Url with no fields'
  end

  describe ":url" do
    context 'when the url is invalid' do
      invalid_url_list = ["www.invalid.com", "invalid.com"]
      # TODO: add more test cases for this

      invalid_url_list.each do |url|
        it 'considers the entity invalid' do
          expect(
            described_class.new(name: "invalid", url:, user_id: 1),
          ).to be_invalid, "considered '#{url}' a valid URL format"
        end
      end
    end

    context 'when the url is valid' do
      valid_url_list = ["https://www.valid.com", "https://valid.com"]
      # TODO: add more test cases for this

      valid_url_list.each do |url|
        it 'considers the entity valid' do
          expect(
            described_class.new(name: "valid", url:, user_id: 1),
          ).to be_valid, "considered '#{url}' a invalid URL format"
        end
      end
    end
  end

  describe ":name" do
    context 'when the name is invalid' do
      invalid_name_list = %w["asdf asdf" asdf??asdf ????? '' as]

      invalid_name_list.each do |name|
        it 'considers the entity invalid' do
          expect(
            described_class.new(name:, url: "https://www.url.com", user_id: 1),
          ).to be_invalid, "considered '#{name}' a valid name format"
        end
      end
    end

    context 'when the name is valid' do
      valid_name_list = %w[asdf igor aaaaaa]

      valid_name_list.each do |name|
        it 'considers the entity valid' do
          expect(
            described_class.new(name:, url: "https://www.url.com", user_id: 1),
          ).to be_valid, "considered '#{name}' a valid name format"
        end
      end
    end
  end
end
