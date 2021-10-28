# dbt_tutorial

### Dependencies
- docker & docker-compose (it is not necessary to create the database in any other way)
- python3 
- [venv](https://docs.python.org/3/library/venv.html)

### Usage
* Create the Postgres database to be used
deploy a postgres in *localhost:5432* witha a database named *postgres*
```sh
make database
```
* Create the virtual environment to be used as a sandbox
this python venv only has the packages dbt-postgres==0.21.0 
```sh
make venv
```
* Upload raw data
load instacart/data/*csv in postgres.raw schema, the name of the tables are the names of the csv file

```sh
make load_data
```
* Clean working directory (this remove the virtual environment)
```sh
make clean
```
* Activate the virtual environment
```sh
source ./venv/bin/activate
```
Once activated the virtual environment I recommend to set the environment variable `DBT_PROFILES_DIR` which points the folder of `profiles.yml`, in this case `export DBT_PROFILES_DIR=$(PWD)` should work; by doing so we can stop setting the `profiles-dir` viariable. 
* Run the models (using venv)
This will run all sql files in `instacart/models` and store the result in `postgres.model` schema
```sh
dbt run --profiles-dir . --project-dir ./instacart
```

### References
* [dbt introduction](https://docs.getdbt.com/docs/introduction)
* [dbt getting started](https://docs.getdbt.com/tutorial/setting-up)
* [dbt command reference](https://docs.getdbt.com/reference/dbt-commands)



