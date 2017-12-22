describe "holiday_supplies_hash" do
# Hash of seasons, the holidays in them, and some items each holiday might have.
  let(:holiday_supplies) {
    {
      :winter => {
        :christmas => ["Lights", "Wreath"],
        :new_years => ["Party Hats"]
      },
      :summer => {
        :fourth_of_july => ["Fireworks", "BBQ"]
      },
      :fall => {
        :thanksgiving => ["Turkey"]
      },
      :spring => {
        :memorial_day => ["BBQ"]
      }
    }
  }

 # Question 1
 # Write a method that returns the second supply for the Fourth of July
  describe "#second_supply_for_fourth_of_july" do
    it "returns the string 'BBQ' without hardcoding it" do
      expect(second_supply_for_fourth_of_july(holiday_supplies)).to eq("BBQ")
      holiday_supplies[:summer][:fourth_of_july][1] = "Watermelon"
      expect(second_supply_for_fourth_of_july(holiday_supplies)).to eq("Watermelon")
    end
  end

  # Question 2
  # Write a method that adds a supply to all Winter holidays
  describe "#add_supply_to_winter_holidays" do
    it "iterates through winter holidays adds a supply to each one" do
      add_supply_to_winter_holidays(holiday_supplies, "Balloons")
      expect(holiday_supplies[:winter][:christmas]).to include("Balloons")
      expect(holiday_supplies[:winter][:new_years]).to include("Balloons")
    end
  end

  # Question 3
  # Write a method that adds a supply to Memorial Day
  describe "#add_supply_to_memorial_day" do
    let(:memorial_day_supplies) { holiday_supplies[:spring][:memorial_day] }

    it "adds a supply to memorial day" do
      add_supply_to_memorial_day(holiday_supplies, "Grill")
      expect(memorial_day_supplies).to include("Grill")
      expect(memorial_day_supplies).not_to include("Table Cloth")
    end

    it "adds a different supply to memorial day" do
      add_supply_to_memorial_day(holiday_supplies, "Table Cloth")
      expect(memorial_day_supplies).to include("Table Cloth")
      expect(memorial_day_supplies).not_to include("Grill")
    end
  end

  # Question 4
  # Write a method that adds a new holiday and its associated supplies to any season
  describe "#add_new_holiday_with_supplies" do
    it "modifies the original hash by adding supplies of a new holiday to a season" do
      expect(holiday_supplies[:fall].keys).not_to include(:columbus_day)

      columbus_day_supplies = ["Flags", "Parade Floats", "Italian Food"]

      add_new_holiday_with_supplies(holiday_supplies, :fall, :columbus_day, columbus_day_supplies)

      expect(holiday_supplies[:fall].keys).to include(:columbus_day)
      expect(holiday_supplies[:fall][:columbus_day]).to match_array(columbus_day_supplies)

      expect(holiday_supplies[:winter].keys).not_to include(:valentines_day)

      valentines_day_supplies = ["Cupid Cut-Out", "Candy Hearts"]
      add_new_holiday_with_supplies(holiday_supplies, :winter, :valentines_day, valentines_day_supplies)

      expect(holiday_supplies[:winter].keys).to include(:valentines_day)
      expect(holiday_supplies[:winter][:valentines_day]).to match_array(valentines_day_supplies)
    end
  end

  # Question 5
  # Write a method to collect all Winter supplies from all the winter holidays
  describe "#all_winter_holiday_supplies" do
    it "has all the winter supplies" do
      ["Lights", "Wreath", "Party Hats"].each do |supply|
        expect(all_winter_holiday_supplies(holiday_supplies)).to include(supply)
      end
    end
  end

  # Question 6
  # Write a method that uses a loop to list out all the supplies you have for each holiday and the season
