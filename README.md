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

- Add column validations for the api.
- Add Database transactions.
- Implement functions to alert user when they try to register again when we already have their details such as telephone and iban which are stored as unique fields in the database.
- implement phpunit tests.
- And sql indexes for faster querying of the database.
- Add redis for caching requests.
- implement proper authentication.
- Document all functions.
- Add url payment url to .env
- Refactor code where necessary.
- create api resources.
- add response codes for success and error

### Frontend

- Implement state management using ngrx/redux.
- Improve the ui,styling and navigation.
- Implement search engine optimizations.
- Implement toaster.
- Add validations for IBAN and telephone number.
- Add tab validation warnings.
- Document all functions.
- implement unit tests.
- Add api url to environment.ts.
- Write app packaging scripts to bundle the backend and frontend together
- Refactor code where necessary.

# How to run the application

### Prerequisites

- install `docker` and `docker compose`.
- clone this application.
- cd into the directory `wunder`.
- run command `docker-compose build`

### After running the command `docker-compose exec php bash` run the following commands.

- `composer install`
- `php artisan migrate`
- `chmod 777 *` (for testing purpose only)
- `exit` (the docker container)
- `cp .env.example .env`

### Generate swagger api documentation

- run command `php artisan l5-swagger:generate` and visit link http://localhost:9090/api/documentation

### Optional step (Frontend compilation).

Note, I have already generated the assets for the frontend and so this step might not be necessary.

- `cd` into `wunder/client`
- npm i
- Run command `npm run build`

# All set?

Yaay! Visit app on http://localhost:9090
