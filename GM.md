# GM
Calendar: ${Product}: Gold Master build is done

#### submit translation packages

Packages that contain translations may need to be updated and submitted

* package-translations
* desktop-translations : X11:common:Factory
* yast2-trans : YaST:Head
* yast2-slide-show : system:install:head
* skelcd-openSUSE : system:install:head
* openSUSE-EULAs: devel:openSUSE:Factory

#### enable OBS:Maintained attribute in :Update project

This is typically set after we do not accept any more changes to GM.
Every new submit request does go to submit channel.

The :Update project needs to have

    <attributes>
    <attribute name="Maintained" namespace="OBS"/>
    <attribute name="BranchTarget" namespace="OBS"/>
    <attribute name="ApprovedRequestSource" namespace="OBS"/>
    </attributes>

=>

    $ osc meta attribute -c -a OBS:Maintained openSUSE:Leap:15.4:Update

And set update project:

    $ osc meta attribute -c -a OBS:UpdateProject -s openSUSE:Leap:15.1:Update openSUSE:Leap:15.1

#### old files kept in pontifex2:/srv/ftp/pub/opensuse/distribution/leap/15.2/repo/oss/
Responsible: rel-mgmt

I found that there are many old files kept in pontifex2:/srv/ftp/pub/opensuse/distribution/leap/15.2/repo/oss/

time ls -l /srv/ftp/pub/opensuse/distribution/leap/15.2/repo/oss/x86_64/|wc
 111800 1006193 10718652

real    1m18.951s
user    0m1.206s
sys     0m2.576s

vs the 20 k files in 15.1

OBS team (Marco) said, they upload their files to pontifex2 and there is only the latest version in the upload dir.


#### prepare GM on download server

Disable publishing of ftp-stage to ftp-prod.
Publish GM data to ftp-prod something like week ahead of time.
Once this is done simply ping Doug/opensuse-marketing, with links to the GM images, as he would like to provide an early access to press.

#### remind maintenance to enable their update crawler

maintenance needs to enable their update crawler as soon as we switch to maintenance mode

#### communicate submission for mainteance to maintenance

Some submission may not have made it into GM. Communicate to maintenance to submit them as update instead.

#### create publish filter for NON_FTP_PACKAGES

Marcus seem to have his own publish filter. Ping him that this needs to be done.

Was:
maintenance team need to add PublishFilter: lines to prjconf of the :Update project to prevent packages in NON_FTP_PACKAGES.group from publishing in maintenance updates

use nonftp2publishfilter.py tool

#### Verify that images are signed

* We no longer have to rename isos, nor sign them manually.
* Verify that isos are signed with openSUSE key

check that we have signature for checksum files eg:
e.g. openSUSE-Leap-15.4-DVD-x86_64-Media.iso.sha256.asc

Check that the build number is not part of -Media*sha256 files

$ cat openSUSE-Leap-15.4-DVD-x86_64-Media.iso.sha256
4683345f242397c7fd7d89a50731a120ffd60a24460e21d2634e783b3c169695
openSUSE-Leap-15.4-DVD-x86_64-Media.iso

Check the signature of the .asc files

gpg: Signature made Mon 30 May 2022 07:05:44 PM CEST
gpg:                using RSA key B88B2FD43DBDC284


#### turn off tools

* switch off bots


#### submit translation packages

Packages that contain translations may need to be updated and submitted

* package-translations
* desktop-translations : X11:common:Factory
* yast2-trans : YaST:Head
* yast2-slide-show : system:install:head
* skelcd-openSUSE : system:install:head
* openSUSE-EULAs: devel:openSUSE:Factory



#### translate openSUSE-EULAs

Since we use openSUSE-EULAs for a warning text we also need a translation for it:
https://github.com/openSUSE/openSUSE-EULAs

#### fix link on openqa.opensuse.org for goldmaster DVD

the maintenance tests expect a goldmaster DVD. A hard or symlink was installed during beta phase at /var/lib/openqa/factory/iso/fixed that points to a specific build. Change the link to point to the iso that is the goldmaster.

#### Security Audit

Security needs to take a look at the current snapshot

#### evaluate results of manual testing with release manager

The results of the manual testing initiative should be talked over with the release manager to determine whether the release is ready for release.

#### call to update release notes

ask people to review and update https://doc.opensuse.org/release-notes/x86_64/openSUSE/Leap/42.3/ via https://github.com/openSUSE/release-notes-openSUSE

Please double check that release notes are building and that cronjob for deployments is running

Example for Leap 15.3

```
Double check that release-notes-openSUSE_Leap_* is building
https://build.opensuse.org/package/show/Documentation:Auto/release-notes-openSUSE_Leap_15.3

$ ssh -p2206 relsync@gate.opensuse.org
$ crontab -l
```

Internal docs reference:
https://confluence.suse.com/pages/viewpage.action?spaceKey=documentation&title=Managing+and+packaging+release+notes

#### merge back maintenance updates

Caution: potentially outdated instructions. Nowadays it's mostly only deleting the obsolete test updates. May need to verify release numbers nevertheless.

maintenance updates from the update project need to be merged back into the main repo

* use osc checkupdate (https://github.com/coolo/factory-auto/osc-plugin-checkupdate.py) to find updated packages
* copy them back using 'osc copypac -e openSUSE:13.2:Update openSUSE:13.2 -m "Update to match Update channel update#."'; On purpose do it by hand without automation to avoid screwups
* adjust the release number to be higher than in the update repo using FIXMEπ
* remove updates from the update repo by using "osc killupdate NUMBER"


[1] adjust the release number by checking the state of the package 'osc getbinaries openSUSE:13.2:Update . standard x86_64' and then writting higher revision to .spec file. To submit this update to repository just use 'osc ci --noservice -m "Add revision to ensure new-enough over Update channel."'
There should be a way to do this by means of obs


#### verify test updates are removed from the patterns

verify that the Supplements in the test update pattern is gone. Should happen automatically via betatest macro but package may not be rebuilt. so better safe than sorry.

#### IPRQ

Create the IPRQ document for upcoming release, ensure that data matches current roadmap and send it to legal for review.
Some information about IPRQ document:

  The IPRQ document is a SUSE internal document used for tracking Intellectual Property.

Gitlab project can be found here https://gitlab.suse.de/opensuse/iprq

```
vim git/IPRQ-openSUSE_Leap_X.Y.odt # see document for previous releases
sudo zypper in perl-Spreadsheet-WriteExcel perl-IO-String perl-Text-CSV_XS perl-Data-Dump perl-DBI perl-DBD-SQLite # required to run make
make
mv git/IPRQ-openSUSE_Leap_X.Y.odt to the newly created directory YYYY-MM-DD_*/
git add YYYY-MM-DD_* # submit only contnet in the directory not the generated data directly in iprq/
git commit && git push
```

All ECR/IPRQ documents (newly generated tarbal from the iprq/) should be revised by Ciaran

#### Send Gold Master announcement for developers

send the information that 15.1 is Gold to opensuse-factory and devel@

#### announce GM deadline internally

we should announce the GM deadline internally just as SLE does

#### notify SCC team about Goldmaster

notify SCC team about GM and release time

#### tell maintenance&security about GM

security@suse.de and maintenance@opensuse.org should know that the new release is in maintenance mode now.
Also remind the about the GA date so they are extra careful about not releasing stuff that could spoil the GA experience.
This was agreed to be done 3 weeks prior GA. So teams have time to test the setup.

#### update web site with new languages
Responsible: AdaLovelace

both landing page and search page got translations for new languages. The languages need to be added to index.html

https://github.com/openSUSE/landing-page
https://github.com/openSUSE/searchPage

#### Switch count down to hourly rendering

Remind Doug/ to switch the cron job that renders the countdown to hourly if not already done.

#### ask maintenance to remove the test updates

the test updates need to be removed from the update channel at some point before GA. Ask maintenance@opensuse.org

There needs to be some maintenance update left always, otherwise YOU complains. So execute only when there are real updates.

#### communicate GM issues to marketing

If there are any known issues in Leap GM as marketing needs to know about them to decide how to communicate them.
Could be any last minute issues, that were found in the product.
