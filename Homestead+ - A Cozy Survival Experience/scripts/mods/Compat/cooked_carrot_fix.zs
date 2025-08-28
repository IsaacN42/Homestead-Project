import crafttweaker.api.food.FoodProperties;

// Get the cooked carrot item
val cookedCarrot = <item:cookedcarrots:cooked_carrot>;

// Define the new food properties with the original nutrition (8) and the new saturation modifier (0.25)
// In-game saturation is calculated as nutrition * saturationModifier * 2
// Original: 8 * 0.75 * 2 = 12
// New: 4 * 1 * 2 = 8
val newFoodProperties = FoodProperties.create(4, 1);

// Assign the new food properties to the cooked carrot
cookedCarrot.food = newFoodProperties;
