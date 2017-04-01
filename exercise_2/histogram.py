from __future__ import absolute_import, print_function, unicode_literals
import sys

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

# Connecting to Database name: Tcount
conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

#Create Curspr
cur=conn.cursor()

cur.execute("select * from tweetwordcount")
rows=cur.fetchall()


if len(sys.argv)==3:
        for r in rows:
                if int(r[1])>=int(sys.argv[1]) and int(r[1])<=int(sys.argv[2]):
                        print(r)
else:
        print("You have to enter only two numbers")



