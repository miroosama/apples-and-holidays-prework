require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
holiday_hash[:winter].each do |holiday, supplies|
  supplies << supply
end
end


def add_supply_to_memorial_day(holiday_hash, supply)
holiday_hash.each do |key, value|
  if key["memorial day"]
    value << supply
  end
end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)


end

def all_winter_holiday_supplies(holiday_hash)

end

def all_supplies_in_holidays(holiday_hash)

end

def all_holidays_with_bbq(holiday_hash)

end
