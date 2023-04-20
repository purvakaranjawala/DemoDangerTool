class User < ApplicationRecord
  scope: active, -> (name) { where(name: name)}
end
