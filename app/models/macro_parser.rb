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
      bmr = ((9.99 * @weight.to_f) + (6.25 * @height.to_f) - (4.92 * @age.to_f) + 5).to_i
    elsif @gender == "F"
      bmr = ((9.99 * @weight.to_f) + (6.25 * @height.to_f) - (4.92 * @age.to_f) - 161).to_i
    end

    if @workout_count && @workout_intensity
      tdee_coef = (@workout_count * @workout_intensity).to_f + 1.2
    end

    tdee = (bmr * tdee_coef)

    case
      when @age < 20
        p_low = 0.7
        p_high = 1.0
        f_low = 0.3
        f_high = 0.45
      when @age >= 20 && @age <= 40
        p_low = 0.8
        p_high = 1.1
        f_low = 0.3
        f_high = 0.45
      when @age > 40
        p_low = 0.85
        p_high = 1.15
        f_low = 0.325
        f_high = 0.45
      end

      case
        when @weight_rate == "Maintain"
          @calories = tdee
          p_high -= 0.15
          f_high += 0.02
          weight_rate_factor = 0
        when @weight_rate == "Lose"
          @calories = tdee * 0.75
          p_high += 0.02
          f_high -= 0.10
          weight_rate_factor = -1.5
        when @weight_rate == "Gain"
          @calories = tdee * 1.2
          p_high -= 0.21
          f_high += 0.06
          weight_rate_factor = 0.65
      end

      if @workout_count && @workout_count == 0
        p_high -= 0.3
      elsif @workout_count && @workout_count > 0
        case
          when @workout_type == "L"
            p_high += 0.03
          when @workout_type == "C"
            p_high -= 0.2
            f_high -= 0.02
          when @workout_type == "M"
            f_high -= 0.02
        end
      end

      @calories = @calories.round(-1)

      @protein = ((@weight * p_high) - ((p_high - p_low)/2) * (weight_rate_factor + 1.5)).to_i

      @fat = ((@weight * f_high) - ((f_high - f_low)/2) * (weight_rate_factor + 1.5)).to_i

      @carbs = ((@calories - ((@protein * 4) + (@fat * 9)))/4).to_i

  end
end
