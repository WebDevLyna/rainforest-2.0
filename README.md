# Rainforest - AMAZON clone

* ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]

* Rails 4.2.5.2


## User Stories:


#### As a user...

1.
  - List of all products, two links (signup & login), create new product link
	- Each product in the list is displayed with its name, description, and price
	- Link to the show page

2.
  - If click on signup button, taken to form ask for email & password
	- Submit form, if email and password is correct, message saying "Successfully signed up"
	- Otherwise, form is rendered again and alert appears "email and/or password are incorrect"

3.
	- Login page, form ask for email and password
	- Submit form, if email and password is correct, message saying "Successfully signed up"
	- Otherwise, form is rendered again and alert appears "email and/or password are incorrect"

4.
  - If click on new product, taken to page with a form
	- Submitting form (3 fields:  name, description, and price in cents) takes to show page for new product

5.
  - homepage, click on product, taken to page with: name, description, price, and reviews.
	- each review includes review itself, who review written by (ie. username), and the date and time it was written at
	- This page also has a form with one text field (can fill in) to create a new review for the product
	- If create product, can see two buttons on the page (edit and delete)


## has_secure_password (bcrypt)

Automatically generates through ActiveRecord::SecurePassword:

```ruby
  user = User.new(name: 'david', password: '', password_confirmation: 'nomatch')
  user.save                                                       # => false, password required
  user.password = 'mUc3m00RsqyRe'
  user.save                                                       # => false, confirmation doesn't match
  user.password_confirmation = 'mUc3m00RsqyRe'
  user.save                                                       # => true
  user.authenticate('notright')                                   # => false
  user.authenticate('mUc3m00RsqyRe')                              # => user
  User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
  User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user
```
