## A repo for the OOI Preload Models

## Installation

1. In a new virtualenv pip install the following packages
 - `requests`
 - `Flask-MVC`
2. In PostgreSQL, create a new database or use an existing one, the one I use is called 'work'
3. Clone this repo

        git clone https://github.com/lukecampbell/ooi-models
        cd ooi-models

4. Edit the `scripts.py` file and replace the `connection_string` with the correct information
5. Run the scripts.py file to bootstrap and initialize the database

        python scripts.py


## Notes

I am in the process of making this place where I threw scratch code actually
maintainable and it will use SQLAlchemy instead of Flask-MVC for the ORM. 



