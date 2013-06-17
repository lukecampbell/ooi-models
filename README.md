## A repo for the OOI Preload Models

## Installation

1. In a new virtualenv pip install the following packages
    pip install -r requirements.txt
2. In PostgreSQL, create a new database or use an existing one, the one I use is called 'work'
3. Clone this repo

        git clone https://github.com/lukecampbell/ooi-models
        cd ooi-models

4. Edit the `init.py` file and replace the connection string with the correct information

        engine = create_engine('postgresql+psycopg2://luke@localhost/work')

5. Run the scripts.py file to bootstrap and initialize the database

        python init.py




