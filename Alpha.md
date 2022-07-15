# Alpha
Calendar: ${Product}:Start of Development phase

#### Create openSUSE:Leap:X.Y project in OBS
Responsible: rel-eng

Send email to autobuild@suse.de to setup following projects

openSUSE:Leap:X.Y
openSUSE:Leap:X.Y:ToTest
openSUSE:Leap:15.4:ARM
openSUSE:Leap:15.4:ARM:ToTest

#### Enable sync sources and binaries from releavant SUSE:SLE project from IBS to OBS

(check whether the SUSE:SLE-15-SPX project already exists, prior making the request)
Please send a request to autobuild@suse.de to sync binaries and sources for SUSE:SLE sources and binaries
Blacklist for packages that need to be skipped from sync can be found here https://en.opensuse.org/Portal:Leap:Jump/OBS/Blacklist

This should ideally be send at least day ahead of the SLE-X-SPY Beta1 date.

mailto: autobuild@suse.de
subject: please sync sources and binaries for SUSE:SLE-X-SPY:GA to OBS after Beta1

Hello Autobuild team,

could you please enable sync of sources and binaries for SUSE:SLE-X-SPY:GA to OBS right after the Beta1
which is expected happen on DD.MM.YYYY. We need them as openSUSE Leap is based on these binaries.

Blacklist of packages that should not be synced, is maintained by autobuild team.


Thank you

#### add link to openSUSE project
Blocks: ask for scc enablement

This can be done by editing top level openSUSE project config

osc meta prj openSUSE -e
    <link project="openSUSE:Leap:X.Y:Update"/> 

This will also make Leap X.Y record visible at https://api.opensuse.org/public/source/openSUSE?view=productlist&expand=1
    <product name="Leap" cpe="cpe:/o:opensuse:leap:X.Y" originproject="openSUSE:Leap:X.Y" originpackage="000product" mtime="1606202898"/>

#### set up :Images subproject

set up the :Images and Images:ToTest as well as ARM:Images and ARM:Images:ToTest subprojects, including Containers: namespace. Use project copy as with main project

#### setup subproject for containers
Responsible: favogt

* create subproject in openSUSE:Containers
* set release target
* adjust and run totest manager
* create openQA job group
* sync to openQA
* make obs publish to the correct directory
* add to get.o.o

#### set end of life attribute in product file
Responsible: rel-mgmt

/etc/products.d/Leap.prod should have the endoflife option set

#### update openSUSE-release package
Responsible: rel-eng

the openSUSE-release package lists some suggested packages, eg java. That may need updating before the release.

#### run desktop-file translation extractor
Responsible: favogt

the extractor of desktop file translations that pushed to github needs to be run

A full rebuild without build-compare is needed.

on https://github.com/openSUSE/desktop-file-translations

Run

    cd 51-xml
    ./download_data.sh download
    ./generate_and_merge_pos.sh download
    git add */*.po */*.pot
    git commit -m update
    git push


#### clarify source code offer
Responsible: rel-mgmt

* clarify how long we need to provide the source
* check if https://get.opensuse.org/leap not specifying methods is ok
* check https://en.opensuse.org/Source_code is current

#### ask for scc enablement
Responsible: rel-mgmt

#### announce start of development
Responsible: rel-mgmt

Send mail to factory and devel mailing lists to announce start of the development phase for a new new distro.

Schedule a short online kickoff event  for the community (1-2h), with announcement at least a week ahead.
Prepare a short introduction covering change in the new version of openSUSE Leap.

#### Add required checks to staging projects
Responsible: mlin7442

We need the required checks for every staging project setup manually.

There is also no osc command for that atm, so it's quite manual.

#### Update 000update-repos config.yml
Responsible: rel-eng

Need to update config.yml in 000update-repos after we got online channel available plus have snapshot published.

#### adjust prjconf
Responsible: rel-mgmt

after copying the sources and before the whole thing builds prjconf needs to be adjusted

* replace old version with new version everywhere
* enable %_with_betatest

#### update .treeinfo file to new version

the treeinfo file in skelcd needs to contain the new version:
https://github.com/openSUSE/skelcd-openSUSE/tree/master/skelcd

#### prepare package translations

Adjust https://github.com/openSUSE/packages-i18n/blob/master/50-tools/urls_opensuse.txt to include the new release. Run the extractor and push.

#### enable legaldb scan

legaldb needs to scan the newly created project. Since it was copied legaldb didn't see requests so doesn't know about the packages in it.

It's configured on botmaster as /srv/go-config/legal-auto-projects-opensuse

#### copy WSL subproject

create the :WSL and :WSL:ToTest subprojects

#### enable CI for YaST

the CI for YaST needs to be configured to submit packages for the new release from the right branch

* yast2-alternatives
* yast2-slp-server
* yast2-docker
* skelcd-control-openSUSE

#### add openqa upgrade tests to/from previous release
Responsible: mgriessmeier

upgrade tests need to include previous release (e.g. 15.4 for Leap 15.5)

#### create external sources list

http://download.opensuse.org/YaST/Repos/openSUSE_Leap_15.1_Servers.xml (defined in https://github.com/yast/skelcd-control-openSUSE/blob/openSUSE-15_1/control/control.openSUSE.xml)

https://github.com/openSUSE/download.o.o

download.o.o pulls automatically every few hours

#### create schedule

create a release shedule.

Schedule is stored in https://github.com/openSUSE/openSUSE-release-process/schedule
Simply copy Leap*schedule.txt file previous release and follow instructions in schedule/README.
Make sure to commit changes to both .txt and .ics file

Update https://en.opensuse.org/openSUSE:Roadmap with information from the new .txt file
Note: The .ics file is used for integration of openSUSE-release-process with progress.opensuse.org (redmine)


#### set up bugzilla queries
Responsible: rel-mgmt

set up bugzilla queries for the new release

* all open bugs
* bugs with priority p2 and higher
* not triaged bugs (P5)
* ship stopper candidates (Custom Search->Flags->is equal to->SHIP_STOPPER?)
* ship stopper candidates (Custom Search->Flags->is equal to->SHIP_STOPPER+)

save search with a name and share them

#### enable bots/tools
Responsible: rel-mgmt

enable bots and tools

* totest manager
* snapshot announcer (make sure to fix links in the template)
* build fail reminder
* staging bot for Backports
* duplicate binaries
* package list generator
* package finder

Add the new release to

* trigger rebuilds

#### update all packages that hardcode the distribution version

All packages that hardcode the distribution version somehow need to be updated with the current version number

* openSUSE.product.in and openSUSE-Addon-NonOss.product.in in 000package-groups
* skelcd-control-openSUSE
* branding-openSUSE
* MozillaFirefox-branding-openSUSE

if needed add local hacks. getting the fix into the build package for example usually takes a way too long time for us. track any local hacks here and don't close ticket before done. Otherwise we may forget them.


Problably only for major versions:

* installation-images

#### sync changes from SLE packages

We need to sync changes from certain SLE packages from SUSE:SLE-15-SPX:GA to Leap
An example would be installation-images


#### upload schedule internally
Responsible: rel-mgmt

Update schedule and other project references (index.htm) at
https://gitlab.suse.de/OPS-Service/projects.nue.suse.com

#### Setup release notes

A branch (typically.g. Leap_X.Y) for new distribution needs to be created in https://github.com/openSUSE/release-notes-openSUSE and the package adjusted accordingly.
Make sure to update release version in release-notes.ent. You may validate your changes to the release by running make and checking index.html in the build dir subtree.

The new branch needs to be set as a default branch for the project. This can be done in project branch settings.

The tokens for OBS are in the factory-maintainer user. Botmaster has all accounts:
sudo docker exec -ti go-agent-repo-checker-3 sudo -i -u go

Instructions how to set up webhooks:
https://openbuildservice.org/help/manuals/obs-user-guide/cha.obs.source_service.html#sec.obs.sserv.github.com

#### create basic wiki structure for new release
Responsible: AdaLovelace

Create the portal page https://en.opensuse.org/Portal:15.2 and template pages for pages that are expected to change. Eg. Screenshots_15.2

Update development related pages with information about the new release

* https://en.opensuse.org/openSUSE:Submitting_bug_reports
* https://en.opensuse.org/openSUSE:Packaging_for_Leap
* https://en.opensuse.org/Portal:Leap

#### submit new Factory packages to Leap
Responsible: rel-eng

Make sure to talk to Bernhard to turn off the bug bot to avoid spamming bugzilla before submitting packages.
Let's not spam everyone's mailbox.

Once disabled:
This is currently a manual effort, to submit packages to main project. Only packages that build will make it.
We're not using https://github.com/openSUSE/osc-plugin-factory/blob/master/fcc_submitter.py


#### prepare get.opensuse.org
Responsible: rel-mgmt

prepare get.opensuse.org to show the testing distribution

https://github.com/openSUSE/get-o-o

#### verify betaversion in product files

*.product need to refer to the correct snapshot name in the <betaversion> tag

Changes there will trigger rebuild so has to be done in advance

#### make sure test updates are in the patterns

the default patterns should include the update test packages so test updates actually get installed. This is triggered by betatest macro in prjconf. So after a first initial full rebuild verify that the default pattern pulls in the update-test pattern.

#### create test plan for manual testing
Responsible: rel-mgmt

create a test plan for people to manually test the distribution

New Plan for Leap 15.X:
https://docs.google.com/spreadsheets/d/1AGKijKpKiJCB616-bHVoNQuhWHpQLHPWCb3m1p6gXPc/edit#gid=94909276

#### publishing and mirror setup
Responsible: rel-mgmt

Set up OBS and Mirror system to handle the new distribution

The ISOs and ftp tree needs to be set to be publish=enabled in OBS. If TTM is not set up yet, enable publishing from :ToTest manually:

     <enable arch="local" repository="images"/>

There is a script somewhere on the obs backend that determines what gets pushed where. Adrian or Coolo know. It needs to be adjusted to handle the new distribution.

On pontifex /etc/rsyncd-internal.conf needs to have modules to allow obs to push to the right locations.
The publish_distro config needs to be adjusted too https://github.com/openSUSE/publish_distro

Checklist:

* BSConfig.pm
* publish script on obs backend
* rsync module on pontifex
* publish_distro on pontifex
* /etc/xinetd.d/scan-updates on pontifex
* enable publishing in project meta
* notify ports maintainers so they do the same
* write mirror@opensuse.org that a new distro is coming

#### update branding
Responsible: hellcp

the new release needs a new branding

* <del>yast color scheme</del>
* <del>yast headline image</del>
* wallpapers
  * KDE
  * GNOME
  * icewm
* plymouth boot splash screen
* grub2 theme
* <del>syslinux theme</del>
* displaymanager themes
  * sddm
  * gdm
  * lightdm
* KDE loading screen
* Headline image for Yast sidebar

#### Add new version in Bugzilla

Make a request for SUSE IT to add new openSUSE Leap version to bugzilla
https://sd.suse.com/servicedesk/customer/portal/1

#### setup openQA
Responsible: okurz

Make a request for openQA https://progress.opensuse.org/projects/openqatests/issues
to update job group for new release: https://openqa.opensuse.org/parent_group_overview/3

Happens here: https://github.com/os-autoinst/opensuse-jobgroups

adjust description and link of the parent group if needed


Dump the templates of the previous distribution, change version and import again. E.g.

script/dump_templates --host https://openqa.opensuse.org --group "openSUSE Leap 42.3" --full > leap

Same with staging projects. Afterwards review and adjust accordingly

Add BETA=1
The staging group may need to be renamed an re-created in order to preserve old results and allow for build numbers to repeat


add upgrade tests from previous release

#### enable iso syncing to openQA
Responsible: okurz

Make a request for openQA https://progress.opensuse.org/projects/openqatests/issues
to setup iso syncing

https://github.com/os-autoinst/openqa-trigger-from-obs

#### copy sources of previous release
Responsible: rel-mgmt

First, ask an obs admin to prepare the "partitioning" setup of OBS for the new release. That makes sure rings and stagings end up on the correct backend.
Also ask for dispatchprios to be adjusted.

When done copy old project to new one with full history:

	$ osc api /source/openSUSE:Leap:15.5?cmd=copy\&oproject=openSUSE:Leap:15.4\&withhistory=1\&comment=branch+from+15.4 -X POST

Adjust prj meta, add reviews etc (check previous release)

        $ osc meta prj -e openSUSE:Leap:15.5

Then copy the rest:

	$ for i in \
		NonFree \
		echo $i; \
		osc api /source/openSUSE:Leap:15.5:$i?cmd=copy\&oproject=openSUSE:Leap:15.4:$i\&withhistory=1\&comment=branch+from+15.4 -X POST; \
		done

Ask an obs admin to copy the signkey for the staging projects from the previous release

To adjust link files osc co -u the project, then

	sed -i -e 's/openSUSE:Leap:15.4/openSUSE:Leap:15.5/' */_link

Fix non oss release file:

        osc api /source/openSUSE:Leap:15.5:NonFree/000release-packages/_aggregate -e

* make sure prjconf contains _with_betatest macros
* don't forget _service in _project
