# Alpha
Calendar: ${Product}:Start of Development phase

#### Create openSUSE:Leap:X.Y project in OBS
Responsible: rel-eng

Send email to autobuild@suse.de to setup the openSUSE:Leap:X.Y and openSUSE:Leap:X.Y:ToTest project.

#### add link to openSUSE project
Blocks: ask for scc enablement

This can be done by editing top level openSUSE project config

osc meta prj openSUSE -e
    <link project="openSUSE:Leap:X.Y:Update"/> 

This will also make Leap X.Y record visible at https://api.opensuse.org/public/source/openSUSE?view=productlist&expand=1
    <product name="Leap" cpe="cpe:/o:opensuse:leap:X.Y" originproject="openSUSE:Leap:X.Y" originpackage="000product" mtime="1606202898"/>

#### set up :Images subproject

set up the :Images and Images:ToTest subproject, including Containers: namespace. Use project copy as with main project

#### setup subproject for containers
Responsible: favogt

* create subproject in openSUSE:Containers
* set release target
* adjust and run totest manager
* create openQA job group
* sync to openQA
* make obs publish to the correct directory
* add to get.o.o


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
Responsible: coolo

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

#### verify rpm changelog cutoff date

RPM changelogs are cut off at a specific date. The date for that may need to be updated

https://bugzilla.opensuse.org/show_bug.cgi?id=1129753

#### update .treeinfo file to new version

the treeinfo file in skelcd needs to contain the new version:
https://github.com/openSUSE/skelcd-openSUSE/tree/master/skelcd

#### prepare package translations

Adjust https://github.com/openSUSE/packages-i18n/blob/master/50-tools/urls_opensuse.txt to include the new release. Run the extractor and push.

#### enable legaldb scan

legaldb needs to scan the newly created project. Since it was copied legaldb didn't see requests so doesn't know about the packages in it.

It's configured on botmaster as /srv/go-config/legal-auto-projects-opensuse

#### copy images subproject

create the :Images and :Images:ToTest subprojects

#### copy WSL subproject

create the :WSL and :WSL:ToTest subprojects

#### enable CI for YaST

the CI for YaST needs to be configured to submit packages for the new release from the right branch

* yast2-alternatives
* yast2-slp-server
* yast2-docker
* skelcd-control-openSUSE

#### add openqa upgrade tests to/from 15.1
Responsible: mgriessmeier

upgrade tests need to include 15.1

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

#### sync changes from SLE packages

We need to sync changes from certain SLE packages from SUSE:SLE-15-SPX:GA to Leap
An example would be installation-images

#### ask for kernel submission
Responsible: rel-eng

ask the kernel submission to prepare a Leap variant based on the SLE kernel

#### enable bots/tools
Responsible: rel-mgmt

enable bots and tools

* totest manager
* origin-manager (jimmy)
* snapshot announcer (make sure to fix links in the template)
* manager_42 (probably obsoleted by origin-manager -> jimmy)
* update_crawler (may also be replaced by origin-manager)
* build fail reminder
* staging bot (jimmy)
* openqa commments (has a different name now, ask jimmy)
* duplicate binaries
* support package rebuild
* package list generator

Add the new release to

* trigger rebuilds

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

for all packages that were added to Factory after the last leap release, set up https://build.opensuse.org/project/show/openSUSE:42:Factory-Candidates-Check to check build success and activate the https://github.com/openSUSE/osc-plugin-factory/blob/master/fcc_submitter.py

Make sure to talk to Bernhard to turn off the bug bot to avoid spamming bugzilla.

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

New Plan for Leap 15.2:
https://docs.google.com/spreadsheets/d/1AGKijKpKiJCB616-bHVoNQuhWHpQLHPWCb3m1p6gXPc/edit#gid=94909276

#### Enable sync sources and binaries from releavant SUSE:SLE project from IBS to OBS

Please send a request to autobuild@suse.de to sync binaries and sources for SUSE:SLE sources and binaries
Blacklist for packages that need to be skipped from sync can be found here https://en.opensuse.org/Portal:Leap:Jump/OBS/Blacklist

This should ideally be send at least day ahead of the SLE-X-SPY Beta1 date.

mailto: autobuild@suse.de
subject: please sync sources and binaries for SUSE:SLE-X-SPY:GA to OBS after Beta1

Hello Autobuild team,

could you please enable sync of sources and binaries for SUSE:SLE-X-SPY:GA to OBS right after the Beta1
which is expected happen on DD.MM.YYYY. We need them as openSUSE Leap is based on these binaries.

Here is a list of packages that should remain blacklisted: (please describe changes if any)
https://en.opensuse.org/Portal:Leap:Jump/OBS/Blacklist


Thank you

#### release maintenance test updates
Responsible: mschnitzer

maintenance needs to release test updates in the update channel

#### create update channel
Responsible: rel-mgmt

In contrast to the main project (#52034) the update projects are meant to start empty. So we create them manually

* The update projects (don't forget :NonFree) need to be created, including attributes (excl OBS:Maintained which will be added later).
* add the new projects to openSUSE:Maintenance meta
* The obs backend mapping file needs to be adjusted to to sync the repos to the correct place on download.opensuse.org

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


#### update all packages that hardcode the distribution version

All packages that hardcode the distribution version somehow need to be updated with the current version number

* openSUSE.product.in and openSUSE-Addon-NonOss.product.in in 000package-groups
* skelcd-control-openSUSE
* build
* branding-openSUSE
* kiwi-boot-descriptions
* MozillaFirefox-branding-openSUSE

if needed add local hacks. getting the fix into the build package for example usually takes a way too long time for us. track any local hacks here and don't close ticket before done. Otherwise we may forget them.


Problably only for major versions:

* installation-images

#### enable iso syncing to openQA
Responsible: okurz

the rsync.pl script needs to be adjust to sync the isos to openQA

when doing that the directory for changes needs to be created
  # cd /var/lib/snapshot-changes/opensuse/
  # mkdir 15.1
  # chown factory-news 15.1
  # setfacl -m u:geekotest:rwx 15.1

run rsync.pl and make sure an entry is created in snapshot-changes. Then symlink the current build:
  # sudo -u geekotest ln -s $BUILDNR current

edit /etc/apache2/conf.d/factory-package-news.conf for the new release

#### Add new version in Bugzilla

https://et.innerweb.novell.com/project_pages/prod_bugz_edit_vrsms.jsp?bcid=1&lid=0&pid=53824

#### setup openQA
Responsible: okurz

update job group for new release: https://openqa.opensuse.org/parent_group_overview/3

adjust description and link of the parent group if needed


Dump the templates of the previous distribution, change version and import again. E.g.

script/dump_templates --host https://openqa.opensuse.org --group "openSUSE Leap 42.3" --full > leap

Same with staging projects. Afterwards review and adjust accordingly

Add BETA=1
The staging group may need to be renamed an re-created in order to preserve old results and allow for build numbers to repeat


add upgrade tests from previous release

#### bootstrap
Responsible: rel-eng

* build ring0 against ring0 of the previous release
* when ring0 is built remove the bootstrap aid
* bootstrap ring1
* let the whole project build (later)
* undo any bootstrap changes, such as brp-extract-translations

#### copy sources of previous release
Responsible: rel-mgmt

First, ask an obs admin to prepare the "partitioning" setup of OBS for the new release. That makes sure rings and stagings end up on the correct backend.
Also ask for dispatchprios to be adjusted.

When done copy old project to new one with full history:

	$ osc api /source/openSUSE:Leap:15.2?cmd=copy\&oproject=openSUSE:Leap:15.1\&withhistory=1\&comment=branch+from+15.1 -X POST

Adjust prj meta, add reviews etc (check previous release)

        $ osc meta prj -e openSUSE:Leap:15.2

Then copy the rest:

	$ for i in \
		NonFree \
		Rings \
		Rings:0-Bootstrap \
		Rings:1-MinimalX \
		Staging Staging:A \
		Staging:A:DVD; do \
		echo $i; \
		osc api /source/openSUSE:Leap:15.2:$i?cmd=copy\&oproject=openSUSE:Leap:15.1:$i\&withhistory=1\&comment=branch+from+15.1 -X POST; \
		done

Ask an obs admin to copy the signkey for the staging projects from the previous release

To adjust link files osc co -u the project, then

	sed -i -e 's/openSUSE:Leap:15.1/openSUSE:Leap:15.2/' */_link

Fix non oss release file:

        osc api /source/openSUSE:Leap:15.2:NonFree/000release-packages/_aggregate -e

* make sure prjconf contains _with_betatest macros
* don't forget _service in _project

Fix rpmlint-AGGR in ring0

        osc api /source/openSUSE:Leap:15.2:Rings:0-Bootstrap/rpmlint-mini-AGGR/_aggregate -e




#### upgrade windows 10 image in openQA
Responsible: rel-mgmt

get QA to upgrade the Windows 10 image in openQA, it's based on a very old version meanwhile and doesn't reflect reality anymore.

#### *update AppStream

AppStream had to be forked in 15.1 for ARM. it's not useful for anything in SLE. sync it up again in SP2 for the sake of it

https://bugzilla.opensuse.org/show_bug.cgi?id=1125898

#### rename product from openSUSE to Leap
Responsible: rel-mgmt

The CPE id of Leap should be "cpe:/o:opensuse:leap:15.2" as reported by /etc/os-release

os-release is currently hacked manually. The real change needs to be in 000package-groups/openSUSE.product.in. It needs to be it needs to be renamed to Leap.product.in:

        <vendor>openSUSE</vendor>
        <name>Leap</name>
        <version>15.2</version>

That has various implications like openSUSE-release.spec renaming to Leap-release.spec with currently unknown consequences to how eg zypp behaves.

The non-oss product also needs to be adopted


TODO list from etherpad so we don't lose it: https://etherpad.nue.suse.com/p/leap_product_rename
openSUSE.product produces a product called "openSUSE" from vendor "openSUSE". What we actually have are products called "Leap" and Tumbleweed" from vendor "openSUSE" though. In order to properly support SCC registration the information OBS has needs to be consistent. Therefore it's desirable to rename the product from openSUSE to Leap.

openSUSE.product.in -> Leap.product.in
openSUSE-release.spec.in -> Leap-release.spec.in

Issues:
    - Quite some packages require openSUSE-release. So there is a compat package that just requires Leap-release.
    - installation-images pulls in openSUSE-release and then fails to resolve deps as the flavor package is missing. So far the flavors were build ignored via prjconf. installation-images also had an extra config to ignore an unresolvable openSUSE-release package. To avoid patching installation-images we just pull in the mini flavor:
        Prefer: Leap-release:Leap-release-mini
     - pkglistgen updating relpkgs will parsing *.product in 000product, but due to the issues below 000product don't have the proper data. Result: old openSUSE release flavor spec file were added back
     - first step of pkglistgen pipe(repochecker) failed due to openSUSE-release package is duplicated. Workaround: installcheck-ignore-duplicated-binaries = openSUSE-release
     - pkglistgen fails in progress due to openSUSE.product.in was renamed however it's required by pkglistgen-locales-from
     - change pkglistgen-locales-from will breaks other stagings and main product build
     - solution: languages list moved to pkglistgen-locale attribute and leave pkglistgen-locales-from empty, thus pkglistgen fetch languages list from an attribute instead of a file
     - remember to update pkglistgen-delete-kiwis-rings and pkglistgen-delete-kiwis-staging otherwise unneeded kiwi file were there
     - update product name in the OSRT:ToTestMnagerConfig - otherwise ttm won't release snapshot to ToTest
     - repository loction needs to update in rsync_opensuse
     - the obs dashboard hardcodes the dvd name so needs to be adjusted src/api/app/models/obs_factory/distribution_strategy_*
     - rsync.pl needs to sync the new product name Leap-dvd5 instead of openSUSE-dvd5
     - NonFree/000release-packages/_aggregate needs to get the right release package
     - rsync.pl for the main repo also needs to sync correct names. The non-oss ftp tree had an inconsistent name though.
     - upgrade tests fail as the openSUSE product vanished and gets replaced by the Leap product. YaST doesnt like that and displays summary in red. https://openqa.opensuse.org/tests/1062080#step/disable_grub_timeout/2
       - needed to add Provides: product() = openSUSE
       - weakremovers handling: http://bugzilla.opensuse.org/show_bug.cgi?id=1155819
       - FIXME: flavor package replacement doesnt work?
         https://github.com/openSUSE/obs-service-product_converter/pull/7
       - baseproduct symlink needs to be taken care of
