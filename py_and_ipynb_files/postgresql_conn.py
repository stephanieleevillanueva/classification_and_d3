from sqlalchemy import create_engine
from pass_ import pass_ #.py file with password (e.g. pass_="abc123")

engine = create_engine('postgresql://username:pass_@localhost:5432/database_name')

#postgresql can be replaced with other supported sql databases such as sqlite or mysql. Be sure to also change default port