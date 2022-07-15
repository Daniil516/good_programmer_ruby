class DualCurrencyPortfolio
  def initialize(params)
    @rub_amount = params[:rub_amount]
    @currency_amount = params[:currency_amount]
    @currency_rate = params[:currency_rate]
  end

  def what_to_do?
    if converting_value.abs <= 0.01
      "Your portfolio is already balanced"
    elsif converting_value > 0
      "You should sell #{converting_value.round(2)} currency"
    else
      "You should buy #{converting_value.round(2).abs} currency"
    end
  end

  private

  #Value that need to be sold or bought by user
  def converting_value
    currency_in_rub = @currency_rate * @currency_amount
    #Converting value(to buy or to sell)
    (currency_in_rub- @rub_amount ) / 2 / @currency_rate
  end
end