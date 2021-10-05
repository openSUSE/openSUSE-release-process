# Beta
Calendar: ${Product}: Beta build is done

#### Maintenance openQA setup
Responsible: qa

Give quality assurance a heads up that Beta build is done. So they can work on the mainteannce setup and start with testing.
Please create request for QA and loop in openSUSE Maintenance team.

#### submit translation packages

Packages that contain translations may need to be updated and submitted

- package-translations : system:install:head
- desktop-translations : X11:common:Factory
- yast2-trans : YaST:Head                    (submit directly to YaST:Head, it does not accept SRs)
- skelcd-openSUSE : system:install:head
- openSUSE-EULAs : devel:openSUSE:Factory


    osc rm *.tar.xz
    osc service dr
    osc addremove
    osc vc         # beautify *.changes: 'M-x sort-lines' and 'M-x delete-duplicate-lines'
    osc ci
    osc sr

#### clean up SLE-workarounds
Responsible: rel-eng

clean up the SLE-workarounds subproject. Check which packages got merged and remove them. Verify the remaining ones are progressing.

#### get rid of repochecker failures
Responsible: rel-eng

remaining repo checker failures need to be fixed:
https://build.opensuse.org/package/view_file/openSUSE:Leap:15.1:Staging/dashboard/repo_checker

Also, the whitelist should be reviewed if it lists too much

#### ask community to add repo xml

Make sure the community repo list gets created:
https://opensuse-community.org/openSUSE_Leap_150_Community_Additional.xml

check the old file for names of people who could do it
http://opensuse-community.org/openSUSE_Leap_423_Community_Additional.xml

then update https://github.com/openSUSE/download.o.o and add the link there

#### verify sle sync
Responsible: rel-mgmt

a mix of stuck tools and other breakages usually leads to packages deviating from SLE.
Compare packages in SLE vs Leap and identify differences to sync up again.
Update SLE-workarounds as needed.

#### create component for a new Leap version in weblate

A Leap 15.X component needs to be created in weblate to collect all projects related to translating leap 15.X

#### enable i586 packages that need it
Responsible: rel-eng

i586 packages with baselibs.conf need to be explicitly enabled by adding them to the whitelist in prjconf.

https://github.com/openSUSE/openSUSE-release-tools/blob/master/biarchtool.py may help with that.

#### interlock
Responsible: rel-mgmt

- prepare interlock lock slides
- send content to individual stakeholders for approval
- ask for date for erf interlock
- present

#### sync prjconf to build package
Responsible: rel-eng

make sure the prjconf of the distr is added to the build package via pull request upstream

#### mirror the release internally
Responsible: rel-mgmt

there are some developers that like to have the release accessible internally via NFS. Ask Rudi to mirror it.

#### update openSUSE-release package
Responsible: rel-eng

the openSUSE-release package lists some suggested packages, eg java. That may need updating before the release.

#### run desktop-file translation extractor

the extractor of desktop file translations that pushed to github needs to be enabled

on https://github.com/openSUSE/desktop-file-translations

Run

    cd 51-xml
    ./download_data.sh download
    ./generate_and_merge_pos.sh download
    git add */*.po */*.pot
    git commit -m update
    git push

#### update copyright year in release notes
Responsible: rel-mgmt

Make sure current year and release date are correct

https://doc.opensuse.org/release-notes/x86_64/openSUSE/Leap/15.1/

#### notify all package maintainers that their package is in Leap

notify all maintainers who have packages in Leap about the fact

https://github.com/openSUSE/openSUSE-release-tools/blob/master/devel-project.py

#### update rpm-groups.pot

rpm-groups.pot is not created automatically. Run once to generate the pot file

https://github.com/yast/yast-translations

#### notify cloud/container/appliance teams of the upcoming release

There is a number of clouds/3rd party hosting out there where openSUSE is
available as option. The responsible people need to be notified of the
schedule in time:

Contacts:
Azure: Alexander Osthof
EC2: Robert Schweickert
Docker: Fabian Vogt
WSL: Scott Reeves
Vagrant: Dan Cermak

#### enable openQA maintenance testing

openQA and the bot needs to be set up to also test maintenance updates for the new release

#### verify betaversion in product files

openSUSE:Leap:42.2/_product/*.product need to refer to the correct snapshot name in the <betaversion> tag
also change the PublishFlags setting

Changes there will trigger rebuild so has to be done in advance

#### submit translation packages

Packages that contain translations may need to be updated and submitted

* [] system:install:head/package-translations
* [] X11:common:Factory/desktop-translations
* [] YaST:Head/yast2-trans
* [] system:install:head/yast2-slide-show
* [] system:install:head/skelcd-openSUSE
* [] devel:openSUSE:Factory/openSUSE-EULAs


#### submit translation packages

Packages that contain translations may need to be updated and submitted

* package-translations
* desktop-translations : X11:common:Factory
* yast2-trans : YaST:Head
* yast2-slide-show : system:install:head
* skelcd-openSUSE : system:install:head
* openSUSE-EULAs: devel:openSUSE:Factory

#### Security Audit
Responsible: jsegitz

Security needs to take a look at the current snapshot

https://bugzilla.suse.com/show_bug.cgi?id=1090647
https://pes.suse.de/Maintenance-Security/Products/leap_sles/

#### Publish announcement of Beta

internally and externally

#### tell nvidia packager to upload drivers

the nvidia drivers need to be uploaded as soon as the kernel ABI is stable enough

#### Call for testing - BetaPizza Parties



#### get signed shim

Talk to security to request and submit a properly signed shim

Shim is mean to be built on a stable distro, eg $Leap-.1. During the submission period to Microsoft it may not be possible to update some packages, eg binutils or openssl to make sure the build stays reproducible. After acquiring the new signature, submit shim to the stable distro to get it officially built and released. Fetch the rpm and put it in the "shim-leap" package for repacking in other code streams like $Leap and TW.

#### call for translation

The most important languages in the distro, esp those on the DVD need to be translated. Remind translation teams.

https://en.opensuse.org/openSUSE:Localization_status

#### verify release notes correctly setup

make sure release notes for the new release appear in
https://doc.opensuse.org/release-notes/x86_64/openSUSE/

#### add new release to OBS distributions
Responsible: rel-mgmt

obs needs a button to easily add the new distro as build repo. Eg. https://build.opensuse.org/project/add_repository_from_default_list/Base:System

Talk to Adrian or some other build service admin

#### Make sure hot-patched change being upstreamed
Responsible: rel-eng

We've hot-patched change in the several packages, those change should go to upstream either to github or OBS.
