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


x=0
if len(sys.argv)==2:
	for r in rows:
		if r[0]==sys.argv[1]:
			print(r)
			x=1
		
else:
	for r in rows:
		print(r)
if len(sys.argv)==2:
	if x==0:
		print("This word is not in list")

