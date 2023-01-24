# URL Shortener

A url shortener rails application, written on ruby-on-rails with postgres databse.

### Versions:
* ruby: 3.1.2
* rails: 7.0.4.1

## Installing and Running

1. Install all gems
    ```shell
    bundle install
    ```

2. Start the database with docker-compose, or configure one to trust connections on port 5432
    ```shell
    docker-compose up -d
    ```

3. Create the database
    ```shell
    rails db:create
    ```

4. Use the seed to create your first user
    ```shell
    rails db:seed
    ```

5. Run the application
   ```shell
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
