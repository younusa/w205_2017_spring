Exercise 2
Step 1. Open EC2 Instance of public AMI UCB MIDS W205 EX2-FULL and log into
instance as root use and mount EBS volume onto /data.As root user, 
user must start postgres by executing /data/start_postgres.sh.
As root user, user must install python interface with postgres "psycopg2"
using "pip install psycopg2==2.6.2" command.
User must also install python interface with twitter "tweepy" using 
"pip install tweepy" command. 

Step 2
The user must then log into user w205 and clone github repository under username
younusa and change directory into exercise_2.

Step 3. User must enter Twitter credentials into the tweets.py file
file located in /home/w205/w205_2017_spring/exercise_2/extweetwordcount/src/spouts. The credentials 
need to be inserted into the relevant fields in the tweets.py text file.
Twitter Credentials
can be found by logging into your username on https://apps.twitter.com and
locating your specific application. The relevant tokens can be found under the
"Keys and Access Tokens" tab. User must sign up for twitter account if user doesn't
already have one.

Step 4. 
Log into postgres using the "psql -U postgres" command and create database and table
before running application. Database name: tcount.
If table name tweetwordcount exists, user should drop this table. 
Table name: tweetwordcount.
Table should be created after user connects into the database using the "\c tcount" command.
Table should be executed using following format:
CREATE DATABASE tcount;
 
CREATE TABLE tweetwordcount
(word TEXT     NOT NULL,
counts INT     NOT NULL);

Step 5. Application Deployment
while pwd is /home/w205/w205_2017_spring/exercise_2/, change directory into
extweetwordcount. At this point, to run application, type "sparse run"

Step 6. Wait for program to execute for around 15-20 minutes and hit ctrl-c to terminate program.

Step 7. Analyze data output in postgres table by changing directory to parent folder (exercise_2)
and use .py scripts to determine word counts of a particular word or of all words


example:
$ "python finalresults.py"
$ "python finalresults.py president"
$ "python histogram.py 1 100"

