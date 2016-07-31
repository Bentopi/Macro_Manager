class MacroParser

  attr_reader :params, :calories, :protein, :carbs, :fat

  def initialize(user_id)
    @user = User.find_by id: user_id
    @age = @user.age
    @gender = @user.gender
    @height = @user.height
    @weight = @user.weight
    @weight_rate = @user.weight_rate
    @workout_count = @user.workout_count
    @workout_type = @user.workout_type
    @workout_intensity = @user.workout_intensity
    @notch = @user.notch

  end

  def parse!

    bmr, tdee_coef = 0, 0

    if @gender == "M"
      bmr = (66 + (6.2 * @weight.to_f) + (12.7 * @height.to_f) - (6.76 * @age.to_f)).to_i
    elsif @gender == "F"
      bmr = (655.1 + (4.35 * @weight.to_f) + (4.7 * @height.to_f) - (4.7 * @age.to_f)).to_i
    end

    if @workout_count && @workout_intensity
      tdee_coef = (@workout_count.to_f * @workout_intensity.to_f) + 1.2
    end

    tdee = (bmr * tdee_coef).to_i

    @calories = (tdee + ((@weight_rate.to_f * 3500)/7)).to_i

    if @age
      age = @age.to_i
    end

    case
      when age < 20
        p_low = 0.7
        p_high = 1.0
        f_low = 0.3
        f_high = 0.45
      when age >= 20 && age <= 40
        p_low = 0.8
        p_high = 1.1
        f_low = 0.3
        f_high = 0.45
      when age > 40
        p_low = 0.85
        p_high = 1.15
        f_low = 0.325
        f_high = 0.45
      end

    case
      when @weight_rate == "-1.5"
        p_low += 0.25
        f_low -= 0.1
      when @weight_rate == "-1"
        p_low += 0.1725
        f_low -= 0.05
      when @weight_rate == "-0.5"
        p_low += 0.1
        f_low += 0
      when @weight_rate == "0"
        p_low += 0.035
        f_low += 0.075
      when @weight_rate == "0.65"
        p_low += 0.01
        f_low += 0.1
    end

    if @workout_count && @workout_count.to_i == 0
      p_low -= 0.2
      f_low += 0.025
    end

    if @workout_count && @workout_count.to_i > 0
      case
        when @workout_type == "L"
          p_low += 0.1
        when @workout_type == "C"
          p_low -= 0.2
          f_low -= 0.03
        when @workout_type == "M"
          p_low += 0.05
          f_low -= 0.02
      end
    end

    @protein = (@weight.to_f * (p_high - ((p_high - p_low)/2) * (@weight_rate.to_f + 1.5))).to_i

    @fat = (@weight.to_f * (f_high - ((f_high - f_low)/2) * (@weight_rate.to_f + 1.5))).to_i

    @carbs = ((@calories - ((@protein * 4) + (@fat * 9)))/4).to_i

    puts "==================="
    puts "age: #{age}"
    puts "gender: #{@gender}"
    puts "height: #{@height}"
    puts "weight: #{@weight}"
    puts "weight_rate #{@weight_rate}"
    puts "workout count: #{@workout_count}"
    puts "workout type: #{@workout_type}"
    puts "workout Intensity: #{@workout_intensity}"
    puts "check out my protein: #{@protein}"
    puts "check out my carbs: #{@carbs}"
    puts "check out my fat: #{@fat}"
    puts "check out my calories: #{@calories}"
    puts "====================="

  end
end
