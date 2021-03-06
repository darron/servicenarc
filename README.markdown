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
	heroku addons:add sendgrid:starter
	heroku config:set EMAIL_FROM="put@email.address.here"
	heroku addons:add newrelic:standard
	heroku config:add RACK_ENV=production
	heroku config:add SERVICENARC_DOMAIN_NAME="put.your.domain.name.here"
	heroku config:add SERVICENARC_SENDMAIL_TZ="MST"
	heroku config:add SERVICENARC_SENDMAIL_TIME="7:45"
	padrino rake secret
	heroku config:add SESSION_SECRET="output-of-previous-command"
	heroku open

One that's done:
----------------

1. Browse to /admin/ - enter the username and password you entered during the seed stage.
2. Create your first "Service"
3. Browse to /admin/services/show/1 - look at the curl command at the bottom of the page.
4. Use that curl command on all of your servers with a unique node name for each.

TODO
----

All logged in [issues](https://github.com/darron/servicenarc/issues).

Patches are welcome - send a pull request and I'll gladly look at it.
