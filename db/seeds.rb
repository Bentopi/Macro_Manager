User.delete_all
Mealplan.delete_all
Meal.delete_all
Recipe.delete_all
Recipepart.delete_all
Ingredient.delete_all


oats = Ingredient.create! name: "Old Fashioned Oats", serving_amount: 0.5,
                  serving_name: "Cup", fat: 3, carbs: 27, protein: 5,
                  calories: 150

protein = Ingredient.create! name: "Chocolate Protein Powder", serving_amount: 1,
                  serving_name: "Scoop", fat: 1, carbs: 2, protein: 24,
                  calories: 115

pizza = Ingredient.create! name: "Lean Cuisine Pizza Spinach & Mushroom Pizza", serving_amount: 1,
                  serving_name: "Pizza", fat: 9, carbs: 56, protein: 22,
                  calories: 390

egg = Ingredient.create! name: "Egg Whites", serving_amount: 0.5,
                  serving_name: "Cup", fat: 0, carbs: 1, protein: 13,
                  calories: 63

bacon = Ingredient.create! name: "Thick Cut Bacon", serving_amount: 1,
                  serving_name: "Slice", fat: 5, carbs: 0, protein: 4,
                  calories: 65

bread = Ingredient.create! name: "Sandwitch Thins", serving_amount: 1,
                  serving_name: "Roll", fat: 1, carbs: 21, protein: 4,
                  calories: 100

cereal = Ingredient.create! name: "Special K Protein Cereal", serving_amount: 0.75,
                  serving_name: "Cup", fat: 1, carbs: 19, protein: 10,
                  calories: 120

milk = Ingredient.create! name: "Unsweetened Vanilla Almond Milk", serving_amount: 1,
                  serving_name: "Cup", fat: 2.5, carbs: 2, protein: 1,
                  calories: 30

banana = Ingredient.create! name: "Medium Banana", serving_amount: 1,
                  serving_name: "Banana", fat: 0.4, carbs: 27, protein: 1.3,
                  calories: 105


teriyaki = Ingredient.create! name: "Trader Joe's BBQ Teriyaki Chicken", serving_amount: 1,
                  serving_name: "Cup", fat: 3.5, carbs: 11, protein: 18,
                  calories: 150

rice = Ingredient.create! name: "Trader Joe's Brown Rice", serving_amount: 0.5,
                  serving_name: "Bag", fat: 1.3, carbs: 36, protein: 3.5,
                  calories: 170

yogurt = Ingredient.create! name: "Dannon Light & Fit Yogurt", serving_amount: 1,
                  serving_name: "Container", fat: 0, carbs: 9, protein: 12,
                  calories: 80

pancakemix = Ingredient.create! name: "Kodiak Power Cakes Mix", serving_amount: 0.5,
                   serving_name: "Cup", fat: 2, carbs: 30, protein: 14,
                   calories: 190


b1 = Recipe.create! name: "Eggs, Bacon & Toast", category: "Breakfast"
b2 = Recipe.create! name: "Special K with Banana", category: "Breakfast"

l1 = Recipe.create! name: "Lean Cuisine Pizza & Shake", category: "Lunch"
l2 = Recipe.create! name: "Chicken Teriyaki Bowl", category: "Lunch"

d1 = Recipe.create! name: "Protein Oats (Proats!)", category: "Dinner"
d2 = Recipe.create! name: "Protein Pancakes", category: "Dinner"

s1 = Recipe.create! name: "Light & Fit Yogurt", category: "Snacks"



Recipepart.create! recipe_id: b1.id, ingredient_id: bacon.id, amount: 1
Recipepart.create! recipe_id: b1.id, ingredient_id: egg.id, amount: 1
Recipepart.create! recipe_id: b1.id, ingredient_id: bread.id, amount: 1

Recipepart.create! recipe_id: b2.id, ingredient_id: cereal.id, amount: 1
Recipepart.create! recipe_id: b2.id, ingredient_id: milk.id, amount: 1
Recipepart.create! recipe_id: b2.id, ingredient_id: banana.id, amount: 0.5

Recipepart.create! recipe_id: l1.id, ingredient_id: pizza.id, amount: 1
Recipepart.create! recipe_id: l1.id, ingredient_id: protein.id, amount: 1
Recipepart.create! recipe_id: l1.id, ingredient_id: milk.id, amount: 1

Recipepart.create! recipe_id: l2.id, ingredient_id: teriyaki.id, amount: 1
Recipepart.create! recipe_id: l2.id, ingredient_id: rice.id, amount: 1

Recipepart.create! recipe_id: d1.id, ingredient_id: protein.id, amount: 1
Recipepart.create! recipe_id: d1.id, ingredient_id: oats.id, amount: 1

Recipepart.create! recipe_id: d2.id, ingredient_id: pancakemix.id, amount: 1
Recipepart.create! recipe_id: d2.id, ingredient_id: milk.id, amount: 0.5

Recipepart.create! recipe_id: s1.id, ingredient_id: yogurt.id, amount: 1



bentopi = User.create! username: "Bentopi", email: "bentopi@topi.com",
                   password: "Bentopi", gender: "M", height: 69,
                   weight: 168.0, age: 29, weight_rate: -1.5,
                   workout_count: 3, workout_intensity: 0.05,
                   workout_type: "L", calories: 1680, fat: 45,
                   protein: 195, carbs: 123, notch: 0.0
