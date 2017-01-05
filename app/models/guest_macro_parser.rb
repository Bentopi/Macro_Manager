  class GuestMacroParser

  attr_reader :params, :calories, :protein, :carbs, :fat

  def initialize(params)
    @params = params
  end

  def parse!

    bmr, age, tdee_coef, weight_rate_factor = 0, 0, 0, 0

    if params[:gender] == "M"
      bmr = ((9.99 * params[:weight].to_f) + (6.25 * params[:height].to_f) - (4.92 * params[:age].to_f) + 5).to_i
    elsif params[:gender] == "F"
      bmr = ((9.99 * params[:weight].to_f) + (6.25 * params[:height].to_f) - (4.92 * age[:age].to_f) - 161).to_i
    end

    if params[:workout_count] && params[:workout_intensity]
      tdee_coef = (params[:workout_count].to_f * params[:workout_intensity].to_f) + 1.2
    end

    tdee = (bmr * tdee_coef)
    @calories = tdee.to_i

    if params[:age]
       age = params[:age].to_i
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
        when params[:weight_rate] == "Maintain"
          p_high -= 0.15
          f_high += 0.02
          weight_rate_factor = 0
        when params[:weight_rate] == "Lose"
          @calories = tdee * 0.75
          p_high += 0.02
          f_high -= 0.10
          weight_rate_factor = -1.5
        when params[:weight_rate] == "Gain"
          @calories = tdee * 1.2
          p_high -= 0.21
          f_high += 0.06
          weight_rate_factor = 0.65
      end


      if params[:workout_count] && params[:workout_count].to_i == 0
        p_high -= 0.3
      elsif params[:workout_count] && params[:workout_count].to_i > 0
        case
          when params[:workout_type] == "L"
            p_high += 0.03
          when params[:workout_type] == "C"
            p_high -= 0.2
            f_high -= 0.02
          when params[:workout_type] == "M"
            f_high -= 0.02
        end
      end

      @calories = @calories.round(-1)

      @protein = ((params[:weight].to_f * p_high)  -  ((p_high - p_low)/2) * (weight_rate_factor + 1.5)).to_i

      @fat = ((params[:weight].to_f * f_high)  -  ((f_high - f_low)/2) * (weight_rate_factor + 1.5)).to_i

      @carbs = ((@calories - ((@protein * 4) + (@fat * 9)))/4).to_i

  end
end
