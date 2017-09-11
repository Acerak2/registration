class AdditionalPayment < ApplicationRecord
  belongs_to :user_event

  def price
    payment_price
  end

  def unpaid?
    payment_amount.nil?
  end

  def donation_amount
    donation = 0
    if charitable_donation? && market_price.to_i < payment_amount.to_i
      donation = payment_amount - market_price
    end
    donation
  end

end
