class Trade < ApplicationRecord
  has_one :advertisement
  has_one :offer

  enum status: [:pending, :done, :cancelled]
end
