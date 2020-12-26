class Delivery < ApplicationRecord
  has_one :purchase
end