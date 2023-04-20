class User < ApplicationRecord
  # scope: active -> (name) { where(name: name) }

  after_create :test_created
  before_save :test_updated
end
