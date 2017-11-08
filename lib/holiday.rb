require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  winter_holidays = holiday_hash[:winter]
  winter_holidays.each {|k, v| winter_holidays[k] = v << supply}
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season.to_sym][holiday_name.to_sym] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].collect {|k, v| v }.flatten
end

def title_format(str_sym)
  out_s = ''
  str_sym.to_s.split(/[\s_]/).each {|s| s[0] != s.capitalize[0] ? out_s << "#{s.capitalize} " : out_s << "#{s} " }
  out_s[0..-2]
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts "#{title_format(season)}:"
    holidays.each do |holiday, supplies|
      puts "  #{title_format(holiday)}: #{supplies.inject('') {|result, supply| result + title_format(supply) + ', '}}"[0..-3]
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  outp = []
  holiday_hash.each do |season, holidays|
    holidays.each{ |holiday, supplies| outp << holiday if supplies.include?('BBQ') }
  end
  outp
end
