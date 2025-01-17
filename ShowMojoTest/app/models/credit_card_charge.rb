class CreditCardCharge < ActiveRecord::Base
  belongs_to :customer

  monetize :amount_cents

  scope :successful, -> {where(paid: true, refunded: false)}
  scope :failed, -> {where(paid: false, refunded: false)}
  scope :disputed, -> {where(paid: true, refunded: true)}
end
