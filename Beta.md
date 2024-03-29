# Beta
Calendar: ${Product}: Beta build is done

#### create update channel
Responsible: rel-mgmt

In contrast to the main project (#52034) the update projects are meant to start empty. So we create them manually

* The update projects (don't forget :NonFree) need to be created, including attributes (excl OBS:Maintained which will be added later).
* add the new projects to openSUSE:Maintenance meta
* The obs backend mapping file needs to be adjusted to to sync the repos to the correct place on download.opensuse.org

#### Maintenance openQA setup
Responsible: qa

Give quality assurance a heads up that Beta build is done. So they can work on the mainteannce setup and start with testing.
Please create request for QA and loop in openSUSE Maintenance team.

#### release maintenance test updates
Responsible: mschnitzer

maintenance needs to release test updates in the update channel


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

#### clean up temporary SLE forks
Responsible: rel-eng

clean up the any temporary SLE forks from subproject.
These forks are only done in Backports projects, not in toplevel openSUSE:Leap
Subprojects are FactoryFork, SLEFork

#### get rid of repochecker failures
Responsible: rel-eng

remaining repo checker failures need to be fixed:
https://build.opensuse.org/package/view_file/openSUSE:Leap:15.1:Staging/dashboard/repo_checker

Also, the whitelist should be reviewed if it lists too much

https://build.opensuse.org/package/show/openSUSE:Backports:SLE-15-SP4:Staging/dashboard

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

#### mirror the release internally
Responsible: rel-mgmt

there are some developers that like to have the release accessible internally via NFS. Ask Rudi to mirror it.

#### run desktop-file translation extractor

There was quite a discussion about this in https://progress.opensuse.org/issues/100023
we need to do this early, as it seems that we need a collaboration from SLES team.

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


#### verify betaversion in product files

openSUSE:Leap:42.2/_product/*.product need to refer to the correct snapshot name in the <betaversion> tag
also change the PublishFlags setting

Changes there will trigger rebuild so has to be done in advance

#### submit translation packages to devel projects and Factory

Packages that contain translations may need to be updated and submitted
This should happen rather regularly.

* [] system:install:head/package-translations
* [] X11:common:Factory/desktop-translations
* [] YaST:Head/yast2-trans
* [] system:install:head/yast2-slide-show
* [] system:install:head/skelcd-openSUSE
* [] devel:openSUSE:Factory/openSUSE-EULAs


#### submit translation packages to Leap

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
Responsible: ddemaio

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

Let's collect any patches/hotfixes that we make for Leap here and didn't make it upstream, typically we have them in subprojects.
We've hot-patched change in the several packages, those change should go to upstream either to github or OBS.
