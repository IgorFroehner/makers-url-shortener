# URL Shortener for Makers Network

A url shortener made for [Makers Network](https://makersnetwork.cc/), writen in rails with postgres database.

### Versions:
* ruby: 3.1.0
* rails: 7.0.1
  
## Installing and Running

1. Install all gems
    ```shell
    bundle install
    ```

2. Configure the DB credentials in .env file, use this [example](docs/example.env).

3. Create the database
    ```
    rails db:create
    ```

4. Run the application
   ```
    rails server
    ```


### Usage

You can access the app in `localhost:3000`. If you have a user, just log in and create your short urls, given it a "name" and the url which
should be redirected when the app is accessed. After having some short url created, to use the shortener,
go to `localhost:3000/<name_that_you_give>`, as well as if it is deployed, it should be `domain/<name_of_the_short_url>`

### TODO

- [ ] Migrate authentication to Devise
- [X] Create tests for models
- [ ] Create tests for controllers
