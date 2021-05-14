# GM
Calendar: ${Product}: Gold Master build is done

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

Plan for 15.1

* log in to download.opensuse.org (pontifex) before ttm released GM to download.o.o!
* hardlink files from 15.1/iso into e.g. 15.1/iso-devel in ftp-stage
* wait for some mirrors to catch up
* sync the change to ftp
* install a redirect rule 15.1/iso into 15.1/iso-devel
* wait for ttm to release final build and publish_distro to do it's initial work
* disable rsync pushing for 15.1 in /etc/rsyncd-internal.conf so obs can't spoil the fun
* remove world access from iso/ so only staging mirrors can pull it
* disable publish_distro for 15.1 (~mirror/bin)
* rename iso images to final names

#### remind maintenance to enable their update crawler

maintenance needs to enable their update crawler as soon as we switch to maintenance mode

#### communicate submission for mainteance to maintenance

Some submission may not have made it into GM. Communicate to maintenance to submit them as update instead.

#### create publish filter for NON_FTP_PACKAGES

need to add PublishFilter: lines to prjconf of the :Update project to prevent packages in NON_FTP_PACKAGES.group from publishing in maintenance updates

use nonftp2publishfilter.py tool

#### sync with SLE

some packages accidentally diverge from sle. try to merge as many as possible

#### sync :NonFree

I think we forgot to activate the update crawler for the :NonFree project. So we should sync with Factory at least once now.

#### eliminate duplicate binaries

packages with duplicate binaries need to be cleaned up as OBS has undefined behavior with those

https://build.opensuse.org/package/view_file/openSUSE:Leap:15.1:Staging/dashboard/duplicate_binaries?expand=1

#### get rid of repochecker failures

remaining repo checker failures need to be fixed:
https://build.opensuse.org/package/view_file/openSUSE:Leap:15.1:Staging/dashboard/repo_checker

Also, the whitelist should be reviewed if it lists too much

#### get iso images signed

* rename iso and .sha256 file to not include Build* anymore
* fix name in .sha256 files
* ask autobuild to sign the files

#### turn off tools

* switch off bots
  * <del>totest manager</del>
  * <del>snapshot announcer</del>
  * <del>manager_42</del>
  * <del>update_crawler</del>
  * <del>build fail reminder</del>
  * <del>staging bot</del>
  * <del>staaging report</del>
* remove 15.1 from
  * <del>trigger rebuilds</del>
  * <del>pkglistgen</del>

#### communicate translation deadline
Responsible: AdaLovelace

last translation packages should be submitted Monday of the GM week. So the deadline should be Sunday.

#### update instlux files

the instlux files on the isos need to be updated to show the current version

#### submit translation packages

Packages that contain translations may need to be updated and submitted

* package-translations
* desktop-translations : X11:common:Factory
* yast2-trans : YaST:Head
* yast2-slide-show : system:install:head
* skelcd-openSUSE : system:install:head
* openSUSE-EULAs: devel:openSUSE:Factory

#### release manager checklist for GA

On download.o.o:

on release day every once in a while scan for mirrors as mirror user:

    mb scan -a -d /distribution/leap/15.1 -j4

In the morning of the release day add the access bits again to make the
content show up and give mirrors time to catch up adding the bits.

Remove the redirect rule before 12:00 UTC


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
sudo zypper in perl-Spreadsheet-WriteExcel perl-IO-String perl-Text-CSV_XS perl-Data-Dump # required to run make
make
mv git/IPRQ-openSUSE_Leap_X.Y.odt to the newly created directory YYYY-MM-DD_*/
git add YYYY-MM-DD_* # submit only contnet in the directory not the generated data directly in iprq/
git commit && git push
```

All ECR/IPRQ documents (newly generated tarbal from the iprq/) should be revised by Ciaran

#### Send Gold Master announcement for developers

send the information that 15.1 is Gold to opensuse-factory and devel@

#### check manual was generated for OSP

ping docu team and ask if the pdf was generated and sent to OSP

#### announce GM deadline internally

we should announce the GM deadline internally just as SLE does

#### set end of life attribute in product file
Responsible: rel-mgmt

/etc/products.d/Leap.prod should have the endoflife option set

#### submit translation packages

Packages that contain translations may need to be updated and submitted

* package-translations
* desktop-translations : X11:common:Factory
* yast2-trans : YaST:Head
* yast2-slide-show : system:install:head
* skelcd-openSUSE : system:install:head
* openSUSE-EULAs: devel:openSUSE:Factory
