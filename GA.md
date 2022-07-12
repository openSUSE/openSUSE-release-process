# GA
Calendar: ${Product}: Public Availability of the Release

#### set link to /distributions/leap in countdown on www.o.o

The countdown on www.opensuse.org links to /distributions/testing. It needs to point to distributions/leap on the release day unless https://github.com/openSUSE/software-o-o/issues/542 gets implemented.


#### set attribute to reject requests


Need to reject requests to the new distro and set update project if not done already:

    osc meta attribute openSUSE:Leap:42.3 -c -a OBS:RejectRequests -s "Please submit to openSUSE:Leap:42.3:Update"
    osc meta attribute openSUSE:Leap:42.3 -c -a OBS:UpdateProject -s openSUSE:Leap:42.3:Update

    osc meta attribute openSUSE:Leap:42.3:NonFree -c -a OBS:RejectRequests -s "Please submit to openSUSE:Leap:42.3:NonFree:Update"
    osc meta attribute openSUSE:Leap:42.3:NonFree -c -a OBS:UpdateProject -s openSUSE:Leap:42.3:NonFree:Update


#### add lock tags

lock the main project and NonFree

  <lock>
    <enable/>
  </lock>


#### update release number in IRC channel topic

opensuse-project (and maybe also other irc channels) mention 42.1 in the channel /topic

This needs to be updated to 42.2 by an IRC channel admin

<blockquote>
/query chanserv access #opensuse-project list
</blockquote>

#### notify studio team about Goldmaster

notify studio team about GM and release time

#### update web site with new languages
Responsible: AdaLovelace

both landing page and search page got translations for new languages. The languages need to be added to index.html

https://github.com/openSUSE/landing-page
https://github.com/openSUSE/searchPage

##### translate social media messages

call for translators for the social media messages

##### Make sure we have the right people prepared to send out the social media messages

Wiki page with social media contact people:
https://en.opensuse.org/openSUSE:Social_media_contacts

Contact them, find the missing people & languages and sync with them about the social media messages. Ideal would be if they create links to the translations in the social media messages we send out etc.

##### Create social media messages

Create social media messages based on our release announcement & top features. See the openSUSE wiki:
https://en.opensuse.org/openSUSE:Social_media_launch_plan

Remember that one goal of these messages is to 'go viral': connect the release to cool stuff but don't push it. Something more widely funny or interesting has more chance of being spread. Including "pls rt" or "pls share" or "share the news:" makes a big difference in how often things are shared, according to research. Worth trying this year.

#### Release Parties

Organize release parties!
* Write release party invitation article
* Update release party wiki pages
* Organize release party in Nue
* Organize release party in Prague
* More?

##### Write release party invitation article

Base it on the article(s) in the last years.

https://en.opensuse.org/openSUSE:Launch_parties
https://news.opensuse.org/2013/11/11/get-ready-to-party-release-is-around-the-corner/

The marketing/ambassador team can and should do this!

##### Update release party wiki pages

Update https://en.opensuse.org/openSUSE:Launch_parties

##### Create event pages on Facebook, Google+

Create event pages for the release on facebook, G+ and other social media!

##### release party poster

There used to be poster for release parties to be used in e.g. universities:
https://en.opensuse.org/openSUSE:Launch_parties

Needs to be updated to current version or be made more generic

#### get.opensuse.org

Verify get.o.o has the correct data and links.
Usually the -Current links are wrong.






















#### Release Announcement

Main task for everything around the release announcement:
* Press announcement
* Community announcement mail
* Community announcement on news.o.o
* Product highlights
* Feature guide
* Screenshots
and finally, the press kit for the press which contains all of the above in addition to a link to the GM, quotes, reviewers guide, list of people who can be interviewed, and gets send to them a week before the release.

##### Assemble the Product highlights

This is about creating a short-list of the best, most awesome, coolest features in openSUSE Leap 42.2. It is CRUCIAL in writing the press announcement, the openSUSE Leap 42.2 portal wiki page and the news.o.o announcement as well as for the press.

Some marketing rules are applied to this list, as they determine what the press will talk about:
* 3x3: 3 main areas with each 3 main feature improvements. Not a black and white rule but keep the total features under 10 and the area's at 3 or 4.
* First, Best, Only: these are the qualities you are looking for in the features. Otherwise, press won't pick up on them, why bother when openSUSE catches up to the rest of the world?
* Impact on users, Resolving major issues, Relevant today: these are less important but relevant properties. Impactful changes, things that change important problems or things tying into recent events or relevant trends are worth having on the list.

The best way of getting to product highlights is to organize a meet with some technical and non-technical folk. Not just the openSUSE team, include Will, Henne, Andreas Jaeger, possibly people from SUSE Marketing and management (Roland perhaps?). Introduce the goal and the how of it (see bullets above), then go over the feature list, pick the things which are important together.

Once done, put them on https://en.opensuse.org/Portal:15.1/Features

##### Get screenshots taken

Bug the openSUSE Artwork team and get help from the openSUSE team: we need screenshots. See https://en.opensuse.org/Screenshots

We need them as soon as the Artwork is final. Start at RC1 and finish at RC2. See the Screenshot Guidelines in the https://en.opensuse.org/openSUSE:Product_highlights_writing wiki page!

##### Write community announcement for news.o.o

Based on the announcement and the feature guide & esp highlights, write a draft announcement for news.opensuse.org. This is the MAJOR announcement everybody will link to so it has to KICK ASS!

##### Write Press Announcement

Take the feature highlights and use them to compose a press announcement. Look at earlier announcements for the how

##### Create a draft press announcement

Take the feature highlights and use them to compose a first draft press announcement.
Some tips:
* Remember the 3x3! From those, pick the most important features to be mentioned. Again, First, Best, Only: something noteworthy.
* The headline summarizes that we released our product ("openSUSE released 13.1"), the sub-title has the most important features that our awesome distro delivers. The following paragraph expands on those and leads to the details that follow.
* Those not reading beyond the first paragraph must know the most important news! So, most important info there. Make sure to clearly answer the 5 W's & H in the first paragraph: Who is this about? What is the actual news? When does this happen? Where does this even take place? Why this is news? How is this happening?
* Include details, numbers, facts and quotes.
* 1 page is best, 2 pages absolute maximum.

Check our previous announcements for more details. 12.3 is here: http://lists.opensuse.org/opensuse-announce/2013-03/msg00001.html

##### Get feedback on the draft press announce

Show the announce to people both engineering and in SUSE marketing for feedback. Incorporate changes.

##### Let our PR Agencies have one last look at the announcement

After this it should be really ready to get into the press kit... No more changes!

##### Get quotes from important people

We usually quote one 'important' SUSE person first, putting the release into perspective. The second quote is usually a non-SUSE community member providing their viewpoint on how awesome the release is.

openSUSE team, the board and other people about their favorite features

Making up the quotes as part of the drafting is the usual way: then let people look at them, modify the quotes and/or OK them.

##### Create a Press Kit and send it to the press

This is the thing which gets us awesome reviews and "blogs like this":http://www.linux-magazine.com/Online/Blogs/Off-the-Beat-Bruce-Byfield-s-Blog/openSUSE-shows-how-to-promote-a-release

We create an awesome presskit containing:
* Press announcement
* Community announcement on news.o.o (link to the preview and if possible a PDF version if it)
* Product highlights (PDF)
* Feature guide (in PDF. Terribly much work, yes, painful, yes worth it, yes)
* Screenshots (include 'bonus' screenshots, if you can)
* a link to the GM
* A document with quotes from the openSUSE team, the board and other people about their favorite features
* reviewers guide
* list of people who can be interviewed

##### Create list of people who can be interviewed

Release team, board members etc.

Ask them, get times and dates which are convenient (in the week between GM and GA). Put in a PDF...

Details needed:

* Some idea of times/dates of availability during the 7 days before and a few days after the release (Nov 12 to 23 or so). Think timezone, like "most days from 17:00-23:00 UTC", specific appointments are made with the journalists.
* email address and phone number

##### Write 'reviewers guide', the mail for the press

We send the press a 'personalized' email. It contains some personal notes from whoever sends it (usually Jos/the CM).

Be sure to have it reviewed.

Example text below from the 12.3 release:
Hi XXX,

As the openSUSE community manager, I am pleased to provide to you the final version of openSUSE 12.3 for your evaluation in advance of its worldwide release on March 13. openSUSE 12.3 comes only six months after our previous release, which means we are back to our usual eight month cycle (12.2 was delayed by two months). Below is a link to the openSUSE 12.3 GoldMaster (final) for your testing pleasure. Also included is a feature overview and press release. The announcement is embargoed until Wednesday, March 13, 2013 at 14:00 UTC.

Notable in openSUSE 12.3 is the addition of OpenStack (Folsom) packages as well as the move to MariaDB as default database. MySQL is still a part of our distribution, so not much will change for the average user as both databases have been part of openSUSE for a long time already.

And there is of course the ARM and ARM 64bit work our ARM team has been doing. We're currently at over 4000 build packages, putting us well ahead of any other Linux distribution supporting ARM's AArch64 architecture. Preview images for installation and testing will be made available when 12.3 is released. The ARM 32bit efforts are progressing too. We plan to release a stable openSUSE 12.3 for ARMv7 shortly after the x86 and x86_64 versions to be released on Wednesday the 13th.

In case you wonder and have followed the controversy, we support UEFI in this release and there's Secure Boot. But, in proper openSUSE fashion, we're not 200% confident about Secure Boot, in part due to the issues with Sony laptops (we will carry the patches making the issue less likely to hit our users). A wiki page is being built on https://en.opensuse.org/openSUSE:UEFI to keep our users informed of our ongoing efforts to solve Secure Boot.

There will be new SUSE Studio images for 12.3 available on release day. Upgrading existing images/appliances will also be possible on Wednesday, March 13.

http://software.opensuse.org has been building openSUSE 12.3 packages for a while and much software is already available. For example, the just released plasmate 1.0 is already built for 12.3!

I'm quite proud of what our desktop teams have done for this release. See http://news.opensuse.org/?p=15318 if you are interested in a preview. There's an awesome video introducing our default desktop, KDE, made by a volunteer (you won't believe he did that in his free time if you see it).

If you have any questions or would like an interview with someone from the openSUSE team, the wider community, the board or me, just let me know.

Kind regards,
Jos Poortvliet
openSUSE Community Manager

*Materials we have for you*

The goldmaster link:
http://download.opensuse.org/xxx
username 'xxx' pw 'xxx'

PLEASE do NOT share this, except perhaps with colleagues who will also observe the EMBARGO!

The official press announcement which we will send on March 13, 14:00
https://github.com/openSUSE/Press-Kit/raw/master/English/openSUSE%20123%20announcement.pdf

The feature guide, detailing many of the features coming in the 12.3 release.
https://github.com/openSUSE/Press-Kit/raw/master/English/Feature%20Guide.pdf

Here's a link to a zip on github containing the above as well as over 40 screen shots you can use any way you like. Note that I included some shots of ARM 64bit, cloud and server stuff (those are text screens mostly).
https://github.com/openSUSE/Press-Kit/archive/master.zip

preview of the announcement article on news.opensuse.org:
https://news.opensuse.org/?p=15299&preview=true

##### Assemble press kit.

Gather everything and put it in a zip file in github (or somewhere else)

##### send press kit

Get our list of press contacts and create SEPARATE mails for each of them. If you know them personally, try to add a special touch to the emails to make them really personal. Stay formal for those you don't know. Send out the mails... And be ready to reply to their questions and responses.

Keep in mind that this can easily take a day with the nr of contacts we have and the replies they might sent.

##### Write the Feature Guide

The Feature Guide forms the base of our release marketing. It is a large list of the most important features in openSUSE 13.1 with screenshots and a good organisation. See https://en.opensuse.org/Features

Find a how-to on writing them here: http://en.opensuse.org/openSUSE:Product_highlights_writing

We've learned some lessons during the 12.3 product highlights writing, take these into account:
* do NOT try to be 'complete'. Going through ALL the changelogs of ALL packages with a script and then filtering out the interesting stuff (we did that, yes) is just way too much work.
* Instead, focus on the most important packages, eg look at http://distrowatch.com/table.php?distribution=suse and pick from the packages there.
* Kick the community to add their features to https://en.opensuse.org/openSUSE:Major_features and use that as a major guide. It is the 'start' of the product highlights.
** for 13.1, Michal send scripted mails to packagers who did 'major stuff'. This seems to have worked quite well: https://github.com/openSUSE-Team/features-reminder
* Get the KDE stuff from the KDE announcement, the GNOME stuff from the GNOME announcement, the kernel stuff from kernelnewbies.org and the H kernel archives as soon as you know which versions we'll ship! Put them on the Major_features page so you're ready with that.
* Kick the artwork team: they need to get the final art in in time so the screenshots can be made! It is a blocker, also for the press kit.

##### Move Major Features to feature guide page

Move content from https://en.opensuse.org/openSUSE:Major_features to https://en.opensuse.org/Features_42.2. Make sure the Major_features page links to this page, directs developers there. Tell them they're late adding their features ;-)

##### Get features page finished

Time to get that feature page finished.
Remember, try to talk at least about the packages from http://distrowatch.com/table.php?distribution=suse!!

Also, integrate the screenshots. They should be created by now but more are always welcome as you'll note while trying to make the feature page pretty.

Note that the major features need to be on this page by the time you start working on the announcement, which is also during this time!

##### Get technical review

The technical people in the openSUSE team need to go over the feature guide, check if it is correct and tell you what is missing.

##### Add features from distrowatch

Check the packages from http://distrowatch.com/table.php?distribution=suse and add what's new. Check other sources, see what's hot and what's not etc. and keep kicking people all around!

Once this is added, the feature page should be ready in terms of content and can be reviewed for technical correctness.

##### Gather info from major pieces of our release onto Major_features page

RC1 is out, so we know what we will ship.

Get the KDE stuff from the KDE announcement, the GNOME stuff from the GNOME announcement, the kernel stuff from kernelnewbies.org and the H kernel archives etc and put the info on the https://en.opensuse.org/openSUSE:Major_features page!

Kick people in the marketing team to help with this.

##### translate release announcement

as usual, we need ping translators to translate release announcement, e.g.

http://lists.opensuse.org/opensuse-translation/2013-11/msg00009.html
##### send announcement to opensuse-announce

the release needs to be  be announced on the opensuse-announce list


#### shop.opensuse.org

##### request new box image and link

request new box image to put on the home page
request link to shop

contact is Gerlinde Regensburger <gr@opensourcepress.de>

##### Shop: update wiki

* https://en.opensuse.org/Buy_openSUSE
* https://de.opensuse.org/openSUSE_kaufen

##### update shop.opensuse.org

source code is at

https://github.com/openSUSE/shop.o.o



#### notify mirror admins

notify mirror@opensuse.org about the release

#### set up update-test project

the update test repo needs to be set up

#### change openSUSE-current

change symlink openSUSE-current in distribution/, update/, source/ and debug/ to point to new release

#### Switch count down to hourly rendering

Remind darix to switch the cron job that renders the countdown to hourly if not already done.

#### make GM images available

several parties need access to the GM images

Usually via password protected place on http://download.opensuse.org/press/

#### install google alerts

install google alerts in order to measure press impact later

keywords e.g. "opensuse release", "opensuse 13.2", "suse 13.2"

#### Update the rsync modules to include new ISO and repo

We have rsync-160hotstuff module and we need to make sure ISOs and repo of the new release is included. at least the popular parts of the distribution from the repo.

It would be good to have this for monday, so 160GB mirrors fetch the repo till release day.

#### Publish an article asking people to help promote the upcoming release.

Write an article like https://news.opensuse.org/2013/10/07/help-promote-opensuse-13-1/ and promote our badges, backgrounds and counter!


https://news.opensuse.org/2019/04/30/help-promote-opensuse-leap-15-1/

#### Adapt http://mirrors.opensuse.org to list the new release

Adapt the mirrorbrain "markers" and the index header template to list which mirrors provide the new release

Template file is
olaf.i.o.o:/srv/www/vhosts/mirrors.opensuse.org/index.html

#### tag docker images

On the release day and time the new release needs to be marked latest in prjconf:

https://build.opensuse.org/project/prjconf/openSUSE:Containers:Leap

some bot also may need adjustment

#### get openSUSE in the Cloud

There is a number of clouds/3rd party hosting out there where openSUSE is
available as option. Leap needs to be uploaded there.

Contacts:
Azure: Alexander Osthof
EC2: Robert Schweickert



#### tell maintenance&security about GM

security@suse.de and maintenance@opensuse.org should know that the new release is in maintenance mode now.
Also remind the about the GA date so they are extra careful about not releasing stuff that could spoil the GA experience.
This was agreed to be done 3 weeks prior GA. So teams have time to test the setup.

#### ask maintenance to remove the test updates

the test updates need to be removed from the update channel at some point before GA. Ask maintenance@opensuse.org

There needs to be some maintenance update left always, otherwise YOU complains. So execute only when there are real updates.

#### find external BT seeders

For future reference: .torrent files are added into pontifex:/var/lib/hefurd and the service needs a restart.

.torrent files can be pulled from mirrorbrain / via the download.o.o iso metalink page

ask for volunteers to seed

The below is old/outdated:
put torrent in separate directories

Torrents are created using /work/cd/bin/torrent-wrapper.pl

This requires make_torrent and dump_torrent from git/libtorrent/examples
To build: zypper in boost-devel libtorrent-rasterbar-devel libtorrent-devel

#### remind opensuse.org admins, builds and infra of the release

remind following teams about the upcomming release

heroes@opensuse.org - verify that the HA proxy can handle the load
buildops@suse.de - no OBS backend maintenance on that day
bs-team@suse.de - no OBS frontend maintenance on that day
create ticket for infra team such as https://sd.suse.com/servicedesk/customer/portal for heads up to Infra team

#### marketing brainstorm session

create a hangout with all the marketing guys to come up with creative things how to promote the release (to find ideas like the green smoke thing on 12.3)

#### communicate GM issues to marketing

If there are any known issues in GM marketing needs to know about them to decide how to communicate them

#### publish docu

doc.opensuse.org
https://en.opensuse.org/SDB:Official_documentation

Ping Frank Sundermeyer about it


##### update wiki pages

Make sure all pages reference $VERSION correctly

* http://en.opensuse.org/Welcome_to_openSUSE.org
* http://en.opensuse.org/Roadmap
* http://de.opensuse.org/OpenSUSE_kaufen
* http://en.opensuse.org/Portal:Installation
* http://en.opensuse.org/Sysreqs
* https://en.opensuse.org/openSUSE:Build_Service_cross_distribution_howto
* https://en.opensuse.org/Portal:Leap
* https://en.opensuse.org/Buy_openSUSE
* https://en.opensuse.org/Package_repositories
* https://en.opensuse.org/Additional_package_repositories

##### move previous release to archive

move all $VERSION-1 articles to Archive

#### update opensuse wiki

##### install Leap 15.X wiki pages as default

move e.g. https://en.opensuse.org/Features_15.X-1 to https://en.opensuse.org/Features

##### fix upgrade instructions in wiki

http://en.opensuse.org/Upgrade needs to be adjusted for new release

##### check all wiki pages on release day

make sure all pages for current Leap release (15.X) are in good shape and the links between pages work

#### update roadmap

mark milestone as released in https://en.opensuse.org/openSUSE:Roadmap

#### Create release counter

Start kicking the artwork team: we need the release counter updated!

https://github.com/openSUSE/countdown.o.o


#### Social media marketing

Create a social media plan and social media messages; and get them translated. Also, prepare our social media channels for this: we need to know who will tweet from eg Chinese channels, or at least that SOMEBODY will, otherwise, why bother translating?

Wiki page with social media plan:
https://en.opensuse.org/openSUSE:Social_media_launch_plan
Wiki page with social media contact people:
https://en.opensuse.org/openSUSE:Social_media_contacts

##### Create social media backgrounds and badges

We need a series of badges and social media backgrounds. Think twitter, facebook, G+ and website banners in various sizes. Ask the artwork team!

#### Update Maintenance Documentation

The maintenance pages need some updating to reflect the current work flow

https://en.opensuse.org/openSUSE:Maintenance_update_process
https://en.opensuse.org/Portal:Maintenance
