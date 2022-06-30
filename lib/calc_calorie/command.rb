require 'calc_calorie'
require 'thor'

module CalcCaloriegem
  class Command < Thor
    desc "calc WEIGHT FAT", "Today's calorie"
    method_option :loss, :aliases => "-l", :desc => "loss weight"
    method_option :gain, :aliases => "-g", :desc => "gain weight"

    def calc(weight, fat_percent)
      weight = weight.to_i
      fat_percent = fat_percent.to_i

      puts "        Weight: #{weight}kg"
      puts "Fat Percentage: #{fat_percent}%"

      lbm = weight * (100 - fat_percent) / 100
      puts "Lean Body Mass: #{lbm}kg"

      puts "----------------"

      if options[:loss]
        kcal = lbm * 35
        protein = kcal * 0.35 / 4
        fat = kcal * 0.1 / 9
        carbohydrates = kcal * 0.55 / 4
      elsif options[:gain]
        kcal = lbm * 45
        protein = kcal * 0.3 / 4
        fat = kcal * 0.15 / 9
        carbohydrates = kcal * 0.55 / 4
      else
        kcal = lbm * 40
        protein = kcal * 0.3 / 4
        fat = kcal * 0.15 / 9
        carbohydrates = kcal * 0.55 / 4
      end

      puts "Today's recommend calorie and PFC is"
      puts "kcal: #{kcal}kcal"
      puts "   P: #{protein.round(1)}g"
      puts "   F:  #{fat.round(1)}g"
      puts "   C: #{carbohydrates.round(1)}g"
      puts "Positive thinking can be contagious. Being surrounded by winners helps you develop into a winner.\n―Arnold Schwarzenegger"
    end
  end
end