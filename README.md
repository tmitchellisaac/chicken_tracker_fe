# chicken-tracker
## Setup
1. `git clone <repo_name>`
2. `cd <repo_name>`
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`

## User Stories

```
Story 1
Welcome Page

When I visit '/'
I see a button to sign up
And I see a button to sign in
```
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

When I visit the new users page
I fill in the form but with a name that is already in use
I press submit
I am taken to the new user page again
And I have an error
```
```
Story 4
Sign Up [SAD] -- Non matching password / password confirmation

When I visit the new users page
I fill in the form but the password and password confirmation don't match
I press submit
I am taken to the new user page again
And I have an error
```
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
