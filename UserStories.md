## User Stories


### Welcome
```
Story 1
Welcome Page

When I visit '/'
I see a button to sign up
And I see a button to sign in
```

### Sign Up
```
Story 2
Sign Up

When I visit '/'
Click a button to sign up
And I am taken to /users/new
I see a form asking for a name, password, and password confirmation
I fill in the form correctly and press Submit
And I am taken to the new user's show page
```
```
Story 3
Sign Up [SAD] -- Non-unique name

As a visitor
When I visit the new users page
I fill in the form but with a name that is already in use
I press submit
I am taken to the new user page again
And I have an error
```
```
Story 4
Sign Up [SAD] -- Non matching password / password confirmation

As a visitor
When I visit the new users page
I fill in the form but the password and password confirmation don't match
I press submit
I am taken to the new user page again
And I have an error
```
### Sign In
```
Story 5
Sign In

When I visit '/'
Click a button to sign in
And I am taken to a sign in page (idk what this would route as)
I see a form asking for a name and password
I fill in the form with the correct info of an existing user and press Submit
And I am taken to the user's show page
```
```
Story 6
Sign In [SAD] -- Wrong sign in information

When I visit '/'
Click a button to sign in
And I am taken to a sign in page (idk what this would route as)
I fill in the form with incorrect info and press Submit
And I am taken to the sign in page with an error
```


### Shelter CRUD
```
Create a Shelter --
As a user 
When I visit 'users/dashboard' (or 'user/show')
I see a button to “Add a New Shelter” 
When I click this button, I am taken to 'shelter/new' where I see a form to create a new shelter
```

```
New Shelter Form -- 
As a user,
When I visit 'shelter/new' I see a form. 
I fill in the form with 'name' and 'shelter type' and click the 'submit' button
I am taken to 'users/dashboard' where I see the new shelter’s name and type under “My Shelters”
```

```
Shelter’s Index Page -- 
As a user, 
When I visit `users/dashboard`, I should see all my shelters listed under “My Shelters” as links
```

```
Shelter’s Show Page --
As a user
When I visit `users/dashboard` and click one of the links representing a shelter, I am take to the shelter’s show page 'users/shelters/1' and I see all the animals included in that shelter
```

```
Edit a shelter -- 
As a user,
When I visit a shelter’s show page 'users/shelters/1',
I see a button to edit that shelter. I click the button and am taken to a form that has all the current information filled out. When I change a value and click 'update', I am taken back to the shelter’s show page and see the updated information
```


```
Delete a shelter -- 
As a user
When I visit a shelter’s show page 'users/shelters/1' I see a button to delete the shelter. When I click this button, and there are no animals inside the shelter, I am taken back to 'users/dashboard' and I no longer see that shelter listed there.

```
```
Delete a shelter [SAD]
No deletion if animals inside shelter --
As a user
When I visit a shelter’s show page 'users/shelters/1', I see a button to delete the shelter. When I click this button, and there ARE animals inside the shelter, I am taken back to 'users/shelters/1' and I see a flash message indicating “you cannot delete a shelter where animals live”
 ```
