Servicenarc
===========

A small Padrino web app, built to have the same functionality as [Dead Man's Snitch](https://deadmanssnitch.com) but to add the ability to have multiple nodes using the same snitch.

Their system is WAY nicer and much, more polished than this - but I don't want to have a snitch / node / cronjob. I want to have a snitch / cronjob and then show each node's status.

Requirements
-------------

Heroku w/Postgres<br/>
Redis

To deploy
---------

Fork and clone this repo - then:

	heroku create
	heroku addons:add redistogo
	git push heroku master
	heroku run rake dm:migrate
	heroku run rake seed
	heroku open

One that's done:
----------------

1. Browse to /admin/ - enter the username and password you entered during the seed stage.
2. Create your first "Service"
3. Browse to /admin/services/show/1 - look at the curl command at the bottom of the page.
4. Use that curl command on all of your servers with a unique node name for each.

TODO
----

1. Add display of all Services and their individual Node states to the homepage dashboard.
2. Email status of all Services and their individual Node states each day to each user.
3. Clean up Padrino boilerplate.
4. Upon deleting of a Service, delete all Redis data with it.
5. Show more historical data on a / service / node basis. Redis only stores 30 / service / node - we don't care more than that.
6. Show time sequence trend and indicate whether a particular node is late / missing.
7. Notifications when something is late / missing.

Patches are welcome - send a pull request and I'll gladly look at it.
