class MacroParser

  attr_reader :params, :calories, :protein, :carbs, :fat

  def initialize(params)
    @params = params
  end

  def parse!

    bmr, age, tdee_coef = 0, 0, 0

    if params[:height_in] && params[:height_ft]
      height = (params[:height_ft].to_f * 12) + params[:height_in].to_f
    end

    if params[:gender] == "M"
      bmr = (66 + (6.2 * params[:weight].to_f) + (12.7 * height) - (6.76 * params[:age].to_f)).to_i
    elsif params[:gender] == "F"
      bmr = (655.1 + (4.35 * params[:weight].to_f) + (4.7 * height) - (4.7 * params[:age].to_f)).to_i
    end

    if params[:workout_count] && params[:workout_intensity]
      tdee_coef = (params[:workout_count].to_f * params[:workout_intensity].to_f) + 1.2
    end

    tdee = (bmr * tdee_coef).to_i

    @calories = (tdee + ((params[:weight_rate].to_f * 3500)/7)).to_i

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
      when params[:weight_rate] == "-1.5"
        p_low += 0.25
        f_low -= 0.1
      when params[:weight_rate] == "-1"
        p_low += 0.1725
        f_low -= 0.05
      when params[:weight_rate] == "-0.5"
        p_low += 0.1
        f_low += 0
      when params[:weight_rate] == "0"
        p_low += 0.035
        f_low += 0.075
      when params[:weight_rate] == "0.65"
        p_low += 0.01
        f_low += 0.1
    end

    if params[:workout_count] && params[:workout_count].to_i == 0
      p_low -= 0.2
      f_low += 0.025
    end

    if params[:workout_count] && params[:workout_count].to_i > 0
      case
        when params[:training_type] == "L"
          p_low += 0.1
        when params[:training_type] == "C"
          p_low -= 0.2
          f_low -= 0.03
        when params[:training_type] == "M"
          p_low += 0.05
          f_low -= 0.02
      end
    end

    @protein = (params[:weight].to_f * (p_high - ((p_high - p_low)/2) * (params[:rate].to_f + 1.5))).to_i

    @fat = (params[:weight].to_f * (f_high - ((f_high - f_low)/2) * (params[:rate].to_f + 1.5))).to_i

    @carbs = ((@calories - ((@protein * 4) + (@fat * 9)))/4).to_i

  end
end
