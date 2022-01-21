class Url < ApplicationRecord
  belongs_to :user
  validates(:url,
            presence: true,
            format: {
              with: URI::DEFAULT_PARSER.make_regexp,
              message: "URL Inválida",
            })
  validates :name, presence: true, uniqueness: true
end
