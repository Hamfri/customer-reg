# A payment gateway implementation

# Technologies used

- PHP 8.0
- Angular 11
- Node 14 (For compilling angular and building the frontend).
- MySQL 8.0
- Docker and Docker compose
- Bootstrap 5
- Bootstrap Icons
- Laravel 8.0
- Nginx

# Performance optimizations to be made.

### Backend

- And sql indexes for faster querying of the database.
- Add redis for caching requests.

### Frontend

- Implement state management using ngrx/redux.
- Make use of IndexDB for state rehydration on page reloads.
- Implement search engine optimizations.

# What could have been done better

## Backend

- Add column validations for the api.
- Add Database transactions to ensure we don't insert data into the database if any of the database transactions fails.
- Implement functionality to alert a user when they try to register again when we already have their details such as telephone and iban which are stored as unique fields in the database.
- Implement phpunit tests.
- Implement proper authentication (login,registration,forgot-password and password-resets)
- Add url payment url to .env
- Refactor code where necessary.
- create api resources.
- Add http response codes for success and error

## Frontend

- Improve the ui,styling and navigation.
- Implement toaster notifications.
- Add validations for IBAN and telephone number.
- Add tab navigation validation warnings.
- Document all functions.
- Implement unit tests.
- Add api url to environment.ts.
- Write app packaging scripts to bundle the backend and frontend together
- Refactor code where necessary.

# Design patterns used

I choose to create the front-end based on angular which is an SPA framework that implements the MVVM design pattern.

## Advantages of model view view model (MVVM).

1. It's highly reactive and hence provides instant feedback to users.
2. It solves the problem of tightly coupled back-ends by ensuring that the front-end and the back-end are decoupled.
3. Saves network bandwidth by avoiding the back and forth page reloads observed in the MVC or MVP patterns.
4. Can be easily ported to a Desktop or mobile application.

# How to run the application

### Prerequisites

- Install `docker` and `docker compose`.
- clone this application.
- cd into the directory `wunder`.
- run command `docker-compose build`
- run `docker-compose up -d`

### After running the command `docker-compose exec php bash` run the following commands.

- run `docker-compose exec php bash`
- `composer install`
- `cp .env.example .env`
- `php artisan migrate`
- `chmod 777 -R *` (for testing purpose only)
- `exit` (the docker container)

### Generate swagger api documentation

- `docker-compose exec php bash`
- run command `php artisan l5-swagger:generate` and visit link http://localhost:9090/api/documentation
- `chmod 777 -R *` (for testing purpose only)
- exit

### Optional step (Frontend compilation).

Note, I have already generated the assets for the frontend and so this step might not be necessary.

- `cd` into `wunder/client`
- npm i
- Run command `npm run build`

# All set?

Yaay! Visit app on http://localhost:9090
