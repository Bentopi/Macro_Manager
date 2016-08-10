User.delete_all
Mealplan.delete_all
Meal.delete_all
Recipe.delete_all
Recipepart.delete_all
Ingredient.delete_all


oats = Ingredient.create! name: "Old Fashioned Oats", serving_amount: 0.5,
                  serving_name: "Cup", fat: 3, carbs: 27, protein: 5,
                  calories: 155

protein = Ingredient.create! name: "Protein Supplement", serving_amount: 1,
                  serving_name: "Scoop", fat: 3, carbs: 6, protein: 24,
                  calories: 147

snack = Ingredient.create! name: "", serving_amount: 1,
                  serving_name: "Snack", fat: 2, carbs: 7, protein: 14,
                  calories: 100

egg = Ingredient.create! name: "Egg Whites", serving_amount: 0.5,
                  serving_name: "Cup", fat: 0, carbs: 2, protein: 14,
                  calories: 60

bacon = Ingredient.create! name: "Thick Cut Bacon", serving_amount: 1,
                  serving_name: "Slice", fat: 7, carbs: 0, protein: 5,
                  calories: 80

bread = Ingredient.create! name: "Bread or Tortilla Item", serving_amount: 1,
                  serving_name: "Serving", fat: 1, carbs: 19, protein: 4,
                  calories: 100

cereal = Ingredient.create! name: "Special K Protein Cereal", serving_amount: 0.75,
                  serving_name: "Cup", fat: 1, carbs: 19, protein: 10,
                  calories: 120

milk = Ingredient.create! name: "Unsweetened Vanilla Almond Milk", serving_amount: 1,
                  serving_name: "Cup", fat: 2.5, carbs: 2, protein: 1,
                  calories: 35

banana = Ingredient.create! name: "Medium Banana", serving_amount: 1,
                  serving_name: "Banana", fat: 0.4, carbs: 27, protein: 1.3,
                  calories: 105

peanutbutter = Ingredient.create! name: "Real Peanut Butter", serving_amount: 1,
                  serving_name: "Tablespoon", fat: 8, carbs: 3, protein: 3.5,
                  calories: 100

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
Requirements:
-Protein powder must not exceed 160kcal per scoop.
-Use regular Quacker Old Fashioned Oats.

<br>
Proats are delicious and filling.
Just 3-4 minutes prep time.

To make:
1) Put oats in microwave safe bowl.
2) Add a pinch of salt and enough water so that the oats are submerged. DO NOT add the protein powder before cooking them.
3) Microwave uncovered for 2:30 minutes.
4) Add protein powder, and a little more water if needed.
5) Eat up.

Tips:
-I've tried a TON of different protein powders over the years, and my favorite is MTS Whey Cookies and Cream.

-If it's the first time you do this, make sure to watch them as they cook, because they have a tendency to spill even if they aren't covered.

-You can add Cinnamon, Stevia or Cocoa powder if you'd like some extra flavor.

-You can experiment with more or less water and figure out what you like; I like mine more sludgy and less runny, so I don't add a lot of water.

-Try to stay away from plant based protein powder unless you're vegan/vegetarian, it just doesn't compare to animal based protein.
"

pancakes_desc = "
Requirements:
-Make sure your Kodiak mix is the POWER cakes version.
-Any Sugar Free Syrup will do, just make sure it doesn't have more than 20-30kcal per serving.
-Unsweetened Vanilla Almond Milk only, 30-40kcal per cup.

<br>
Kodiak Cakes Power Cakes taste amazing, and are way easier to make and better for you than regular buttermilk pancakes.
Just 5-7 minutes prep time.

To make them:
1) Mix ingredients in a bowl/tupperware.
2) Heat up a pan, apply cooking spray and pour pancake mix.
3) Perform a perfect 10/10 pancake flip (important).
4) Measure and serve your sugar-free syrup.
5) Eat up.

Tips:
-You can buy a big box of the pancake mix at Costco, Target, and many other places.
-If you have trouble, you can always check <strong><a href=\"http://www.kodiakcakes.com/store-locator-map/\">HERE</a></strong> to find a store near you.
-There's also other protein-pancake-mix brands like Flap Jacked which do have better macros, but are a tad more expensive and can overcook and taste like cardboard really easily. (Amazon sells it)
-I like to break away pieces of the pancake/waffle and dip it into my measured syrup cup, kinda like <strong><a href=\"https://pickyglutton.files.wordpress.com/2013/12/injera-platter-at-lalibela.jpg\">Ethiopian Injera</a></strong>, It's great.
"

eggs_desc ="
Requirements:
-Egg whites, not whole eggs; Separating Egg whites from whole eggs is not worth it.
-Each serving of bread/tortilla is 100kcal, choose whatever you want, but I recommend low carb tortillas because of the high fiber.

<br>
A classic, you can't go wrong with this one.
Just 5 minutes prep time.

This one should be pretty self explanatory, but regardless:
1) Set pan on very high and fry your bacon.
2) Remove bacon when done and add the egg whites to the bacon fat covered pan, then sprinkle salt/pepper on them.
3) Heat/toast up your bread/tortilla however you like.
4) Put it all in a plate aaaand.
5) Eat up.

Tips:
-If your meal calls for more than one piece of bacon, there might be too much bacon grease left to cook your eggs, you can always take some out if this makes you uncomfortable. I like bacon grease so I leave it.
-Costco Sells a box of Kirkland Egg White Cartons, and they are your best bet for the price.
-Egg Beaters and other egg product (99% fat free), are fine to use.
"

cereal_desc = "
Requirements:
-Unsweetened Vanilla Almond Milk only, 30-40kcal per cup.
-Special K Protein Cereal only, unless find something that is equivalent calorie-wise per serving.
-Your peanut butter should only have 1 ingredient on it's list: Peanuts. (and maybe some salt)
-A tablespoon of peanutbutter is not the same as creating Mt. Everest on your spoon; either measure it, or scrape your spoon against the edge of the jar on your way out.

<br>
I hope you don't need instructions on how to assemble a bowl of cereal lol.
"

lunch_desc = "
Requirements:
-Stay under the calorie limit.

<br>
You get to choose whatever you want! This leaves you with a ton of options, but here's what I would do:

-Super Easy: something from a health/fit meals company like SnapKitchen, MyFitFoods, Muscle Maker Grill, etc. Preferably something that has some veggies in there.

-Still Easy but requires some prep: Cook up some protein in a crockpot or oven, and stirfry a ton of mixed veggies; you can cook lunches for a whole week pretty easily.

A great combo is to buy a huge bag of Kirkland Frozen Mixed Veggies at Coscto and stir fry about 500g of that with one bag of BBQ Chicken Teriyaki from Trader Joe's.
I'll have some recipes for this up soon; In the meantime just ask me for suggestions, I have plenty of options for you.
"

snack_desc = "
Requirements:
Each Snack cannot exceed 100kcals.

<br>
Snacks are great, and you can choose to have yours whenever you want.

My top picks are:
-Light & Fit Dannon Yogurt: Coconut Vanilla is the best flavor. <br>
-Yasso Frozen Yogurt Ice Cream bars: Decent macros and you can find them easily. <br>
-Enlightened Ice Cream Bars: These ones have some advanced chocolate/caramel swirl technology. <br>
-Whatever your favorite thing is (up to 100kcals)

If you're lucky enough to have more than one snack, you can combine them into one bigger snack.
Try <strong><a href=\"https://www.skinnycow.com/products/detail.aspx?id=69\">THIS ONE</a></strong> (Takes up 2 snacks)
"

coffee_desc = "
Before we start:
You don't really need to have your coffee with protein, you can opt to just have black coffee with sweetener (stevia is best), and just drink a protein shake with water.

<br>
Requirements:
-Just buy prepackaged Premier Protein shakes at Costco (I do this). OR
-Use any protein coffee powder with 150~160kcal a per scoop.
-Do not add anything else that has calories (creamers, sugar).


You have two options:
-If you bought the prepackaged shakes, just make your coffee first, and then as much shake as you want into each coffee you have, until you drink the whole shake.

-If you use protein powder, it's going to have to be iced coffee, heating up protein powder usually ends up with bad results.
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
