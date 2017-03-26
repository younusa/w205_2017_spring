import tweepy

consumer_key = "vpL1Jg9TmrxVGXlA9AOOQu0ge";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "tzJs5XUdJHe0jrE9wVsRYkKHK2jKHDQIXdprTlv7j29yLiy0N7";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "845735195638673408-WPbpZGsEN5pQ6A39bMrHR62OPgCmBx8";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "RpdxYUulyilEIMk5OscU4YlXMq9l2asJDF3rCdkaisMke";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



