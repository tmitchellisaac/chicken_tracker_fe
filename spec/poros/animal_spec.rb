require "spec_helper"
require_relative "../../app/poros/animal" # <-- I don't know why this is needed

RSpec.describe Animal do
  it "exists" do
    attr = {:id=>"1",
    :type=>"animal",
    :attributes=>
      {:shelter_id=>1,
      :name=>"Tom",
      :species=>"chicken",
      :birthday=>"2023-03-03",
      :color=>"orange",
      :main_prey=>"Seeds, Fruit, Insects, Berries",
      :habitat=>"Open woodland and sheltered grassland",
      :diet=>"Omnivore",
      :skin_type=>"Feathers",
      :top_speed=>"6 mph",
      :avg_litter=>"2",
      :lifespan=>"2 - 4 years",
      :weight=>"1kg - 3kg (2.2lbs - 6.6lbs)",
      :lifestyle=>"Flock",
      :fav_food=>"Seeds"},
    :relationships=>{:shelter=>{:data=>{:id=>"1", :type=>"shelter"}}}}
    animal = Animal.new(attr)

    expect(animal).to be_a(Animal)
    expect(animal.id).to eq(attr[:id])
    expect(animal.name).to eq(attr[:attributes][:name])
    expect(animal.species).to eq(attr[:attributes][:species])
    expect(animal.birthday).to eq(attr[:attributes][:birthday])
    expect(animal.color).to eq(attr[:attributes][:color])
  end

  describe "instance methods" do
    before do
      @attr = {:id=>"1",
        :type=>"animal",
        :attributes=>
          {:shelter_id=>1,
          :name=>"Tom",
          :species=>"chicken",
          :birthday=>"2023-03-03",
          :color=>"orange",
          :main_prey=>"Seeds, Fruit, Insects, Berries",
          :habitat=>"Open woodland and sheltered grassland",
          :diet=>"Omnivore",
          :skin_type=>"Feathers",
          :top_speed=>"6 mph",
          :avg_litter=>"2",
          :lifespan=>"2 - 4 years",
          :weight=>"1kg - 3kg (2.2lbs - 6.6lbs)",
          :lifestyle=>"Flock",
          :fav_food=>"Seeds"},
        :relationships=>{:shelter=>{:data=>{:id=>"1", :type=>"shelter"}}}}
      @today = DateTime.parse("2024/03/11")
    end

    describe "#age" do
      it "calculates the age of the animal based on birthday with years, months, and days" do
        fufu = Animal.new(@attr)
        expect(fufu.age(@today)).to eq("1 year(s), 0 month(s), 8 day(s)")

        @attr[:attributes][:birthday] = "2023/06/12"
        lola = Animal.new(@attr)

        expect(lola.age(@today)).to eq("0 year(s), 8 month(s), 28 day(s)")

        @attr[:attributes][:birthday] = "2020/07/10"
        belle = Animal.new(@attr)

        expect(belle.age(@today)).to eq("3 year(s), 8 month(s), 1 day(s)")

        @attr[:attributes][:birthday] =  "2020/03/10"
        fufu = Animal.new(@attr)

        expect(fufu.age(@today)).to eq("4 year(s), 0 month(s), 1 day(s)")
      end

      it "gives an error if the birth date is a future date" do
        @attr[:attributes][:birthday] = "2024/06/12"
        fufu = Animal.new(@attr)
        @attr[:attributes][:birthday] =  "2024/03/25"
        lola = Animal.new(@attr)

        expect(fufu.age(@today)).to eq("Error, the animal hasn't been born yet")
        expect(lola.age(@today)).to eq("Error, the animal hasn't been born yet")
      end
    end

    describe "#days_in_month" do
      it "calculates the number of days in a given month(1-12) for the current year" do
        fufu = Animal.new(@attr)
        expect(fufu.days_in_month(10)).to eq(31)

        fufu = Animal.new(@attr)
        expect(fufu.days_in_month(2)).to eq(29)
      end

      it "returns nil when a month's corresponding number doesn't exist" do
        fufu = Animal.new(@attr)
        expect(fufu.days_in_month(14)).to eq(nil)

        fufu = Animal.new(@attr)
        expect(fufu.days_in_month(0)).to eq(nil)
      end
    end

    describe "#age_in_days" do
      context "the birth day is less than the current day" do
        it "subtracts the current day from the birth day" do
          @attr[:attributes][:birthday] = "2023/03/03"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] = "2023/03/10"
          lola = Animal.new(@attr)

          expect(fufu.age_in_days(@today, DateTime.parse(fufu.birthday))).to eq(8)
          expect(lola.age_in_days(@today, DateTime.parse(lola.birthday))).to eq(1)
        end
      end

      context "the birth day is greater than the current day" do
        it "subtracts the total days in the previous month by the birth day, and adds the current day" do
          @attr[:attributes][:birthday] = "2020/02/29"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] = "2023/02/12"
          lola = Animal.new(@attr)

          expect(fufu.age_in_days(@today, DateTime.parse(fufu.birthday))).to eq(11)
          expect(lola.age_in_days(@today, DateTime.parse(lola.birthday))).to eq(28)
        end
      end
    end

    describe "#age_in_months" do
      context "the birthday month and the current month are the same" do
        it "returns 0 if the current day >= the birth day" do
          @attr[:attributes][:birthday] = "2023/03/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] = "2023/03/05"
          lola = Animal.new(@attr)
          expect(fufu.age_in_months(@today, DateTime.parse(fufu.birthday))).to eq(0)
          expect(lola.age_in_months(@today, DateTime.parse(lola.birthday))).to eq(0)
        end

        it "returns 11 if the current day < birth day" do
          @attr[:attributes][:birthday] = "2023/03/26"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] = "2023/03/12"
          lola = Animal.new(@attr)

          expect(fufu.age_in_months(@today, DateTime.parse(fufu.birthday))).to eq(11)
          expect(lola.age_in_months(@today, DateTime.parse(lola.birthday))).to eq(11)
        end
      end

      context "the current month is > the birthday month" do
        it "subtracts the birthday month from the current month" do
          @attr[:attributes][:birthday] = "2023/01/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2023/02/26"
          lola = Animal.new(@attr)

          expect(fufu.age_in_months(@today, DateTime.parse(fufu.birthday))).to eq(2)
          expect(lola.age_in_months(@today, DateTime.parse(lola.birthday))).to eq(0)
        end
      end

      context "the birthday month > the current month" do
        it "subtracts the months between today and the birth month from the total months" do
          @attr[:attributes][:birthday] = "2023/06/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2020/12/30"
          lola = Animal.new(@attr)

          expect(fufu.age_in_months(@today, DateTime.parse(fufu.birthday))).to eq(9)
          expect(lola.age_in_months(@today, DateTime.parse(lola.birthday))).to eq(2)
        end
      end
    end

    describe "#age_in_years" do
      context "birth year is current year" do
        it "does not add a year" do
          @attr[:attributes][:birthday] = "2024/01/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2024/03/"
          lola = Animal.new(@attr)

          expect(fufu.age_in_years(@today, DateTime.parse(fufu.birthday))).to eq(0)
          expect(lola.age_in_years(@today, DateTime.parse(lola.birthday))).to eq(0)
        end
      end

      context "birth month is greater than current month" do
        it "subtracts current year by birth year - 1" do
          @attr[:attributes][:birthday] = "2023/07/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2020/12/30"
          lola = Animal.new(@attr)

          expect(fufu.age_in_years(@today, DateTime.parse(fufu.birthday))).to eq(0)
          expect(lola.age_in_years(@today, DateTime.parse(lola.birthday))).to eq(3)
        end
      end

      context "birth month is less than current month" do
        it "subtracts current year by birth year" do
          @attr[:attributes][:birthday] = "2023/01/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2020/02/28"
          lola = Animal.new(@attr)

          expect(fufu.age_in_years(@today, DateTime.parse(fufu.birthday))).to eq(1)
          expect(lola.age_in_years(@today, DateTime.parse(lola.birthday))).to eq(4)

        end
      end

      context "birth month is the same as current month" do
        it "subtracts current year by birth year - 1 if the birthday day > current day" do
          @attr[:attributes][:birthday] = "2022/03/15"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2020/03/29"
          lola = Animal.new(@attr)

          expect(fufu.age_in_years(@today, DateTime.parse(fufu.birthday))).to eq(1)
          expect(lola.age_in_years(@today, DateTime.parse(lola.birthday))).to eq(3)
        end

        it "subtracts current year by birth year if the current day >= birthday day" do
          @attr[:attributes][:birthday] = "2022/03/11"
          fufu = Animal.new(@attr)

          @attr[:attributes][:birthday] =  "2020/03/03"
          lola = Animal.new(@attr)

          expect(fufu.age_in_years(@today, DateTime.parse(fufu.birthday))).to eq(2)
          expect(lola.age_in_years(@today, DateTime.parse(lola.birthday))).to eq(4)
        end
      end
    end
  end
end
