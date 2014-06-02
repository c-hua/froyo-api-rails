#RSPEC LAB -- MODEL & CONTROLLER SPECS

##The Froyo App

###Guidelines
- Remember the burrito app? We thought you might be a little bit tired of tortillas, so we're switching themes over to frozen yogurt -- but the general concept is the same. For now, we'll keep things simple; there's just one model (Yogurt) and we will assume that users don't need to log in to order.
- No controllers or views today; **just models**
- Use `rails c` or `psql` if you need to check out what's going on database-wise

###Get Set Up
- Create a new Rails/PG app
- Bring in RSpec (gem, generator, etc)
- Generate a model for your yogurt (fields of your choosing, but a nice base version includes flavor, topping, and quantity:float)
- Do your rake tasks (don't forget `rake db:migrate RAILS_ENV=test`!)


###Spec It Out

####Model Specs

Write as many model tests as you see fit, but make sure your app adheres to the following:

- Yogurts aren't valid without a flavor, topping, and quantity
- Yogurt quantity should be a number
- Users can't order yogurt in quantities larger than 12oz
- Users can't order negative quantities of yogurt
- Users can't order yogurt in quantites of zero
- Yogurt costs 15 cents per ounce; you'll need a method to calculate the price of a yogurt based on its quantity
- The worker at the froyo shop knows menu items by name; you'll need a method that creates an order name (String) in the format of "**QUANTITY** oz of **FLAVOR** yogurt with **TOPPING**"
- Users should be able to query the list of yogurts and only show those with certain letters in the name 
	- for this sample, let's set two scopes -- **starts_with_c** and **starts_with_s**
	- some good sample flavors to test these include **chocolate**, **coffee**, and **strawberry**
	
####Controller Specs

Write as many controller tests as you see fit, but make sure your app adheres to the following:

- The Index action should render a template called Index.
- On the Index view, I should see a list of all yogurts, which means something has to be assigned to represent all yogurts.
- The Show action should render a template called Show.
- On the Show view, I should see the yogurt I asked for (by id) in the URL.
- The New action should render a template called New.
- On the New view, I should see a form connected to a new yogurt (@yogurt).
- The Edit action should render a template called Edit.
- On the Edit view, I should see a form connected to the existing yogurt record (@yogurt) that I wish to edit.
- I should know what valid attributes for a yogurt are/are not.
- (if valid attributes) The Create action should save the new yogurt to the database.
- (if valid attributes) After the save, the app should redirect me to the Index of yogurts.
- (if invalid attributes) The Create action should not save the new yogurt record.
- (if invalid attributes) The New view should be rendered again.
- (if valid attributes) The Update action should save the updated yogurt record (@yogurt) to the database.
- (if valid attributes) After the save, the app should redirect me to the Index of yogurts.
- (if invalid attributes) The Update action should not save the updated yogurt record.
- (if invalid attributes) The Edit view should be rendered again.
- The Destroy action should delete the selected yogurt.
- After the yogurt is deleted, the app should redirect me to the index of yogurts.

###Red, Green, Refactor!
- Write code to make your tests pass (after they fail!)
- Make sure your tests are specific -- only check for one result per test
- Test edge cases -- if you're max'ing out the yogurt quantity at 12oz, see what happens with 6oz, 12oz, and 20oz

###Demo!

Show us what you did :) We'll share at the end of lab time.

(If your group finishes early, start doing controller specs for your Project 3!)



