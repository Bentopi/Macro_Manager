User.delete_all
Mealplan.delete_all
Meal.delete_all
Recipe.delete_all
Recipepart.delete_all
Ingredient.delete_all


oats = Ingredient.create! name: "Old Fashioned Oats", serving_amount: 0.5,
                  serving_name: "Cup", fat: 3, carbs: 27, protein: 5,
                  calories: 150

protein = Ingredient.create! name: "Protein Supplement", serving_amount: 1,
                  serving_name: "Scoop", fat: 1, carbs: 2, protein: 24,
                  calories: 150

snack = Ingredient.create! name: "", serving_amount: 1,
                  serving_name: "Snack", fat: 2, carbs: 7, protein: 16,
                  calories: 100

egg = Ingredient.create! name: "Egg Whites", serving_amount: 0.5,
                  serving_name: "Cup", fat: 0, carbs: 1, protein: 13,
                  calories: 63

bacon = Ingredient.create! name: "Thick Cut Bacon", serving_amount: 1,
                  serving_name: "Slice", fat: 5, carbs: 0, protein: 4,
                  calories: 65

bread = Ingredient.create! name: "Bread or Tortilla Item", serving_amount: 1,
                  serving_name: "Serving", fat: 1, carbs: 21, protein: 4,
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

peanutbutter = Ingredient.create! name: "Real Peanut Butter", serving_amount: 1,
                  serving_name: "Tablespoon", fat: 8, carbs: 3, protein: 3.5,
                  calories: 100

                  # 4 oz or 120g
meat = Ingredient.create! name: "Chicken, Tilapia or Lean Meat", serving_amount: 1,
                  serving_name: "portion", fat: 3, carbs: 0, protein: 30,
                  calories: 150


rice = Ingredient.create! name: "Rice", serving_amount: 1,
                  serving_name: "Cup", fat: 1, carbs: 45, protein: 5,
                  calories: 200

vegetable = Ingredient.create! name: "Veggies", serving_amount: 1,
                   serving_name: "Cup", fat: 2, carbs: 8, protein: 2,
                   calories: 50

syrup = Ingredient.create! name: "Sugar Free Syrup", serving_amount: 0.25,
                  serving_name: "Cup", fat: 0, carbs: 8, protein: 0,
                  calories: 20

pancakemix = Ingredient.create! name: "Kodiak Power Cakes Mix", serving_amount: 0.5,
                   serving_name: "Cup", fat: 2, carbs: 30, protein: 14,
                   calories: 190

lunch = Ingredient.create! name: "kcals Maximum", serving_amount: 100,
                           serving_name: "", fat: 4, carbs: 7, protein: 8,
                           calories: 100

proats_desc = "
  Proats are delicious and filling. 3-4 minutes prep. <br>

  To make them: <br>

  1) Put oats in microwave safe bowl.<br>

  2) Add a pinch of salt and enough water so that the oats are submerged. DO NOT add the protein powder before cooking them.<br>

  3) Microwave uncovered for 2:30 minutes.<br>

  4) Add protein powder, and a little more water if needed.<br>

  5) Eat up.

  <p>
  If it's the first time you do this, make sure to watch them as they cook, because they have a tendency to spill even if they aren't covered.
  You can also add Cinnamon, Stevia or Cocoa powder if you'd like some extra flavor.
  You can experiment with more or less water and figure out what you like; I like mine more sludgy and less runny, so I don't add a lot of water.
  </p>
"

pancakes_desc = "
  Kodiak Cakes Power Cakes taste like the real thing, but are way easier to make and better for you. 5 minutes prep. <br>

  To make them: <br>

  1) Mix ingredients in a bowl/tupperware.<br>

  2) Heat up a pan, apply cooking spray and pour pancake mix<br>

  3) Perform a perfect 10/10 pancake flip (important)<br>

  4) Pour your sugar-free syrup into a measuring cup<br>

  5) Eat up.

  <p>
  You can buy a big box of the pancake mix at Costco, Target, and many other places
  You can always check <strong><a href=\"http://www.kodiakcakes.com/store-locator-map/\">here</a></strong> to find a store near you, but it really shouldn't be hard.
  There's also other brands like Flap Jacked which have better macros (check Amazon), but is a tad more expensive and can overcook and taste like cardboard really easily.
  </p>
"

eggs_desc ="
  A classic, you can't go wrong with this one, 5 minutes prep. <br>

  This one should be pretty self explanatory, but regardless:<br>

  1) Set pan on very high and fry your bacon<br>

  2) Remove bacon when done and add the egg whites to the bacon fat covered pan, then sprinkle salt/pepper on them.<br>

  3) Heat/toast up your bread/tortilla however you like<br>

  4) Put now cooked eggs on plate with bacon and bread/tortilla<br>

  5) Eat up.

  <p>
  I recommend you buy a carton of eggwhites rather than trying to separate them from whole eggs.

  Whole eggs are great, but don't fit into this meal plan; bacon is the source of fat chosen here, and it's grease will flavor up your egg whites really well.

  The yellow egg white products are also fine, just check that their macros have almost zero fat and carbs.
  You can buy a big box of Eggwhites and Bacon at Costco, or the Egg white cartons at any grocer <br>

  For the bread/tortilla, each serving is equal to 100kcals, so choose whatever makes you the happiest that meets that.

  I personally recommend low-carb tortillas because they are really high in fiber. (fiber = smooth poops)
"

cereal_desc = "
 Not going to explain this one, I'm sure you can figure this one out.

 The one thing that really matters here is that your Peanut Butter's ingredient list only has one ingredient: Peanuts (and maybe salt).

 On that note, a tablespoon of peanut butter is not the same as a colossal mountain of peanut butter on a tablespoon.
 Scrape it against the edge of the jar on the way out and make it flat!.

"

lunch_desc = "
You get to choose whatever you want under the calorie limit! <br>

This leaves you with a ton of options, but here's my 2 cents:

Super Easy: a meal healthy/fit meals company like SnapKitchen, MyFitFoods, Muscle Maker Grill, etc. Preferably something that has some veggies in there. <br>
Not as easy but cheap: Cook up some protein in a crockpot or oven, and stirfry a ton of mixed veggies; you can cook lunches for a whole week pretty easily. <br>
If you want to go this route, just ask me for suggestions, I got plenty of options for you.
"

snack_desc = "
Snacks are great, and you can choose to have yours whenever you want. Each snack is 100kcals. <br>
If you're lucky enough to have more than one snack, you can combine them into one bigger snack.

My top picks are:

-Light & Fit Dannon Yogurt: Coconut Vanilla is the best flavor. <br>
-Yasso Frozen Yogurt Ice Cream bars: Decent macros and you can find them easily. <br>
-Enlightened Ice Cream Bars: These ones have some advanced chocolate/caramel swirl technology. <br>
-Whatever your favorite thing is (up to 100kcals)
"

coffee_desc = "
Coffee is a staple in most people's lives; the problem is when you add a ton of creamers and sugar to it.

We are going to make protein coffee, and there's two ways to go about this:

The super easy: Buy a case of prepackaged Premier Protein Shakes (30g protein, 160kcal) found at Costco, and just add some to each cup of coffee you drink until you drink one full shake.

The still pretty easy: Make a shake using a scoop of protein powder (so much work!), and pour it into your coffee.
Any Protein powder will do as long as it has less than 150-160kcal per scoop;

Also, don't buy plant based protein powder unless you're vegan.

They also sell some Protein Coffee Mix, and it's alright to use if you love it.
"







b1 = Recipe.create! name: "Protein Oats aka Proats!", collection: "Breakfast Lovers", category: "Breakfast", description: proats_desc
b2 = Recipe.create! name: "Protein Pancakes", collection: "Breakfast Lovers", category: "Breakfast", description: pancakes_desc

d1 = Recipe.create! name: "Eggs, Bacon & Toast", collection: "Breakfast Lovers", category: "Dinner", description: eggs_desc
d2 = Recipe.create! name: "Special K with Banana & Peanut Butter",collection: "Breakfast Lovers", category: "Dinner", description: cereal_desc

l1 = Recipe.create! name: "Lunch is Freedom!", collection: "Breakfast Lovers", category: "Lunch", description: lunch_desc
l2 = Recipe.create! name: "Lunch is up to you!", collection: "Breakfast Lovers", category: "Lunch", description: lunch_desc

s1 = Recipe.create! name: "Snack", collection: "Breakfast Lovers", category: "Snacks", description: snack_desc
p1 = Recipe.create! name: "Protein Coffee", collection: "Breakfast Lovers", category: "Protein Shake", description: coffee_desc



Recipepart.create! recipe_id: d1.id, ingredient_id: bacon.id, amount: 1
Recipepart.create! recipe_id: d1.id, ingredient_id: egg.id, amount: 1
Recipepart.create! recipe_id: d1.id, ingredient_id: bread.id, amount: 1

Recipepart.create! recipe_id: d2.id, ingredient_id: cereal.id, amount: 1
Recipepart.create! recipe_id: d2.id, ingredient_id: milk.id, amount: 0.5
Recipepart.create! recipe_id: d2.id, ingredient_id: banana.id, amount: 0.5
Recipepart.create! recipe_id: d2.id, ingredient_id: peanutbutter.id, amount: 1


Recipepart.create! recipe_id: l1.id, ingredient_id: lunch.id, amount: 1
Recipepart.create! recipe_id: l2.id, ingredient_id: lunch.id, amount: 1
# Recipepart.create! recipe_id: l1.id, ingredient_id: meat.id, amount: 1
# Recipepart.create! recipe_id: l1.id, ingredient_id: rice.id, amount: 0.5
# Recipepart.create! recipe_id: l1.id, ingredient_id: vegetable.id, amount: 0.5

Recipepart.create! recipe_id: b1.id, ingredient_id: protein.id, amount: 1
Recipepart.create! recipe_id: b1.id, ingredient_id: oats.id, amount: 1

Recipepart.create! recipe_id: b2.id, ingredient_id: pancakemix.id, amount: 1
Recipepart.create! recipe_id: b2.id, ingredient_id: milk.id, amount: 0.5
Recipepart.create! recipe_id: b2.id, ingredient_id: syrup.id, amount: 1

Recipepart.create! recipe_id: s1.id, ingredient_id: snack.id, amount: 1
Recipepart.create! recipe_id: p1.id, ingredient_id: protein.id, amount: 1



bentopi = User.create! username: "Bentopi", email: "bentopi@topi.com",
                   password: "Bentopi", gender: "M", height: 69,
                   weight: 164.0, age: 29, weight_rate: -1.5,
                   workout_count: 4, workout_intensity: 0.05,
                   workout_type: "L", calories: 1680, fat: 45,
                   protein: 195, carbs: 123, notch: 0.0
