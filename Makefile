database:
	docker-compose up -d


venv: requirements.txt
	@echo "--CREATING virtual enviroment venv--";
	@python3 -m venv venv;
	@echo "--INSTALLING dependencies--";
	@. venv/bin/activate; 
	@pip install -r requirements.txt;


load_data: venv
	@echo "--LOADING data--";
	@. venv/bin/activate; 
	dbt seed --project-dir instacart --profiles-dir $(PWD)  --target raw;


clean:
	@echo "--DELETING venv and pycache--";
	@rm -r venv; find . | grep -E "(.cache|debug.log|.csv)" | xargs rm -rf;
	@find . | grep -E "(__pycache__|.pytest_cache)" | xargs rm -rf;