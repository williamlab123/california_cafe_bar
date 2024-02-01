class BeehiveGroup < ApplicationRecord
  belongs_to :user

  HONEY_AMOUNT_GRAMS_PRECISION = 4

  def calculate_honey_amount
    return @calculate_honey_amount if @calculate_honey_amount

    # each beehive produces about 20kg of honey each 4 months
    # so this method calculates the amount of honey produced by each beehive
    # since the day it was created until now(the day the method is called)

    # first we get the amount of days since the beehive was created
    days_since_created = ((Time.zone.now - created_at) / (1.minute * 1.day))
    # now considering that 4 mounths have 120 days, we can calculate
    # the amount of honey produced by the beehive
    honey_amount_per_beehive = ((days_since_created.to_f / 120) * 20)
    total_honey_amount = honey_amount_per_beehive * beehive_amount

    total_honey_amount -= honey_retrievement.to_f

    @calculate_honey_amount = total_honey_amount.truncate(HONEY_AMOUNT_GRAMS_PRECISION)

    
  end

  def isFull?
    # this method checks if the the total of beehives have reached the total of honey
    # that each one can store, that is 20kg per beehive each 4 months

    # 1 beehive can store 20kg of honey each 4 months
    max_honey_amount = beehive_amount * 20

    calculate_honey_amount >= max_honey_amount
  end

  def collect
    update!(honey_retrievement: calculate_honey_amount + honey_retrievement.to_f)
  end
end
