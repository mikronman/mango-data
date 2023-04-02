# Mango Data Database Repository

This repository contains the schema file and migration scripts for the Mango Data database. This database is hosted on Heroku.

## Getting Started

To set up and run the local PostgreSQL environment, follow these steps:

1. Install PostgreSQL on your local machine. For macOS users, you can use Homebrew: `brew install postgresql`
2. Start the PostgreSQL service: `brew services start postgresql`
3. Create a local database and user for the Mango Data project (replace `<username>` and `<password>` with your desired values): 


## Workflow

1. **Pull schema and migration scripts from GitHub**: Before working on the project, ensure you have the latest schema and migration scripts. Run `git pull` to fetch the latest changes from the `mango-data-db-repo` repository.

2. **Apply migration scripts**: Use a schema migration tool like Flyway or Alembic to apply the migration scripts in the correct order. This ensures your local database is up to date with the latest schema changes.

3. **Make changes and push to GitHub**: When you make changes to the schema or create new migration scripts, commit your changes and push them to GitHub: 


4. **Update the Heroku database**: To update the Heroku database for the development environment, follow these steps:
a. Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli) and log in to your account.
b. Add a remote to your local Git repository that points to your Heroku app: `heroku git:remote -a your-app-name`
c. Push the changes to Heroku: `git push heroku master`
d. Apply the migration scripts to the Heroku database using your preferred schema migration tool.

## Data Migration Tools

When altering the database structure, it's important to use a data migration tool to ensure a smooth transition. For macOS users, [Flyway](https://flywaydb.org/) is a popular choice for managing database migrations. To use Flyway:

1. Download and install Flyway from the [official website](https://flywaydb.org/download).
2. Configure Flyway to connect to your local and Heroku databases by setting the appropriate connection details in the `flyway.conf` file.
3. Place your SQL migration scripts in the `sql` directory of your Flyway installation.
4. Use the `flyway migrate` command to apply migrations to the target database.

## Additional Information

- Keep communication open among team members regarding schema changes and data migrations.
- Always test migrations in a local or development environment before applying them to production or staging environments.
- Create backups of your production database before applying migrations.

Feel free to contribute and improve this README as the project evolves.
