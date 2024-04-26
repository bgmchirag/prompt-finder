# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Dependencies
* Ruby: 3.1.1
* Rails: 7.1.3.2
* Redis: 6.x

## Getting Started without docker


## Database setup

  ```bash
  $ rails db:create
  ```

  ```bash
  $ rails db:migrate
  ```

  ```bash
  $ rails db:seed
  ```

## Run rspec

  ```bash
  $ rspec
  ```

## Run rubocop

  ```bash
  $ rubocop
  ```

## Start Application

  ```bash
  $ rails s
  Go to `http://localhost:3000` to access the landing page
  ```


## Using docker


## Build docker image

  ```bash
  $ docker-compose build
  ```

## Update database.yml

  ```bash
  $ Replace `host` from `localhost` to `db` for development and test
  ```


## Database setup

  ```bash
  $ docker-compose run web rake db:create
  ```

  ```bash
  $ docker-compose run web rake db:migrate
  ```

  ```bash
  $ docker-compose run web rake db:seed
  ```

## Run rspec using docker compose

  ```bash
  $ docker-compose run --rm -e "RAILS_ENV=test" web bundle exec rspec spec
  ```

## Run rubocop using docker compose
  ```bash
  docker-compose run --rm -e "RAILS_ENV=test" web bundle exec rubocop
  ```
## Run application using docker compose
  ```bash
  docker-compose up
  Go to `http://localhost:3000` to access the landing page
  ```



## Future Enhancements
Consider the following enhancements for future development:

1. User Authentication:

  ```bash
  Implement user authentication to secure the application and manage user-specific functionalities.
  ```

2. API Documentation:

  ```bash
  Provide comprehensive API documentation for developers, detailing available endpoints, request/response formats, and authentication mechanisms.
  ```

3. Continuous Integration:
  
  ```bash
  Integrate a continuous integration service to automate testing and deployment workflows, ensuring code quality.
  ```

4. Exception Handling
  
  ```bash
  Ensure robust error handling for Algolia-specific exceptions and promptly notify the admin of any issues.
  ```

4. Monitoring and Logging:
  ```bash
  Implement tools for monitoring application performance and logging to facilitate debugging and issue resolution.
  ```

5. Contributing Guidelines:
  ```bash
  Clearly outline guidelines for contributing to the project, making it easier for external contributors to understand the development process.
  ```

6. Docker Compose Profiles:
  ```bash
  Consider creating different Docker Compose profiles for development, testing, and production environments, each with tailored configurations.
  ```

7. Security Considerations:
   ```bash
   Include security best practices and considerations for securing the application and its dependencies.
   ```

8. Extend features:
   ```bash
   - Implement robust user authentication to enhance security measures.
   - Consider leveraging an intermediate database to store datasets, enhancing scalability and manageability on our end.
   - Implement APIs and Enhance documentation by integrating Swagger for clear and comprehensive documentation of the APIs, making it easier for developers to understand, test, and integrate with the system.
   - Enhance the user interface for universal accessibility by implementing responsive design, ensuring optimal performance on all devices and operating systems.
   ```


## Heroku link
  ```bash
  https://prompt-finder-app-1be9f24a1a12.herokuapp.com/
  ```