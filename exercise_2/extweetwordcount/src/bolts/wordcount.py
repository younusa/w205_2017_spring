from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
    def process(self, tup):
        word = tup.values[0]


        # Increment the local count
	self.counts[word] += 1
        self.emit([word, self.counts[word]])
		
        
        # Connecting to Database name: Tcount	
	conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
	conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)

	#Creating cursor
	cur = conn.cursor()
	
	#Insert Word
	
	cur.execute("UPDATE tweetwordcount set counts=counts+1 where word = %s",(word,))
	
	cur.execute("INSERT INTO tweetwordcount (word,counts) \
			Select %s,1 WHERE NOT EXISTS (SELECT * FROM tweetwordcount WHERE word = %s)", (word, word))
       	conn.commit()
	
	cur.close()
	conn.close()
		
        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))

