# RC
Calendar: ${Product}: RC build is done

#### update desktop file translations

There was quite a discussion about this in https://progress.opensuse.org/issues/100023
* in weblate commit all pending changes

In desktop-file-translations:

* check 51-xml/download_data.sh
* export password
* run make
* verify and check

#### clean up build fails

Needs to happen at beginning of Beta phase

be more agressive with build fails
- wipebinaries of failed packages after checking whatdependson
- wipebinaries of unresolvables
- file delete requests

#### get rid of repochecker failures
Responsible: rel-eng

remaining repo checker failures need to be fixed:
https://build.opensuse.org/package/view_file/openSUSE:Leap:15.1:Staging/dashboard/repo_checker

Also, the whitelist should be reviewed if it lists too much

https://build.opensuse.org/package/show/openSUSE:Backports:SLE-15-SP4:Staging/dashboard

#### set up redirects for repository structure on download.o.o

The paths referenced in this view:
https://api.opensuse.org/public/source/openSUSE:Leap:15.1/000product?view=productrepositories&product=openSUSE

should be reflected on http://download.opensuse.org/repositories/

Should be just a matter of installing some redirects.

#### eliminate duplicate binaries

packages with duplicate binaries need to be cleaned up as OBS has undefined behavior with those

run `osc staging -p PROJECT check_duplicate_binaries`

#### make sure new maintenance packages end up in the release

maintenance probably released several packages that are new in the previous release. We need to make sure to collect them for the new release


#### remove beta marks
Blocks: remove README.beta from oss repository

* remove %_with_betatest from prjconf
* remove beta tag from .product.in in 000package-group, well be acked by pkglistgen
* remove BETA=1 from openQA
* rebuild patterns-base and skelcd-openSUSE

#### remove README.BETA from oss repository

README.BETA is from skelcd-openSUSE, rebuild skelcd-openSUSE after the betamark removal then README.BETA should not present in skelcd-openSUSE.
However due to rsync mechanism, there are two things have to be done manually,

1. Login to openQA server and remove README.BETA from /var/lib/openqa/factory/repo/FTP_ASSET_PATH, including the BuildXXX asset and the currect asset.

2. Login to pontifex.infra.opensuse.org and remove README.BETA from /srv/ftp-{stage,prod}/pub/opensuse/distribution/leap/15.3/repo/oss/ directory so only README file remains.

If we keep README.BETA then user would receive still Beta warning during Leap RC build installation.
The ftp-prod is crucial, please double check there.

#### openSUSE-EULAs up to date

devel:openSUSE:Factory/openSUSE-EULAs needs to be up to date to include all relevant licenses. Ie licenses that require explicit agreement via dialog by the user. That affects mostly packages in the openSUSE:Leap:15.0:NonFree project.

The sources are at github: https://github.com/openSUSE/openSUSE-EULAs

#### submit translation packages to Leap

Let's submit translations at the beginning of RC phase.

Packages that contain translations may need to be updated and submitted

- package-translations : system:install:head
- desktop-translations : X11:common:Factory
- yast2-trans : YaST:Head                    (submit directly to YaST:Head, it does not accept SRs)
- skelcd-openSUSE : system:install:head
- openSUSE-EULAs : devel:openSUSE:Factory


    osc rm *.tar.?z
    osc service dr
    osc addremove
    osc vc         # beautify *.changes: 'M-x sort-lines' and 'M-x delete-duplicate-lines'
    osc ci
    osc sr

#### verify piwik works
Talk to Doug

#### submit translation packages to Leap

Let's submit translations at the END of RC phase, after the deadline for Translations https://en.opensuse.org/openSUSE:Roadmap.

Packages that contain translations may need to be updated and submitted

- package-translations : system:install:head
- desktop-translations : X11:common:Factory
- yast2-trans : YaST:Head                    (submit directly to YaST:Head, it does not accept SRs)
- skelcd-openSUSE : system:install:head
- openSUSE-EULAs : devel:openSUSE:Factory


    osc rm *.tar.gz
    osc service dr
    osc addremove
    osc vc         # beautify *.changes: 'M-x sort-lines' and 'M-x delete-duplicate-lines'
    osc ci
    osc sr

#### communicate translation deadline
Responsible: AdaLovelace

last translation packages should be submitted Monday of the GM week. So the deadline should be Sunday.


#### make sure nvidia packages are ready for GA

NVidia drivers are nowadays usually ready way before GA. Ping the driver maintainer to make sure that is the case actually.

#### merge back maintenance updates

maintenance updates from the update project need to be merged back into the main repo

* use osc checkupdate (https://github.com/coolo/factory-auto/osc-plugin-checkupdate.py) to find updated packages
* copy them back using 'osc copypac -e openSUSE:13.2:Update openSUSE:13.2 -m "Update to match Update channel update#."'; On purpose do it by hand without automation to avoid screwups
* adjust the release number to be higher than in the update repo using FIXMEπ
* remove updates from the update repo by using "osc killupdate NUMBER"


[1] adjust the release number by checking the state of the package 'osc getbinaries openSUSE:13.2:Update . standard x86_64' and then writting higher revision to .spec file. To submit this update to repository just use 'osc ci --noservice -m "Add revision to ensure new-enough over Update channel."'
There should be a way to do this by means of obs




#### prepare get.opensuse.org

prepare get.opensuse.org for RC1

* https://github.com/openSUSE/get-o-o, _data/releases.yml, _data/15X.yml
* Sync with hellcp to deploy update when mirrors are ready

#### EULA review/update

Please adjust year in the EULA with e.g. sed and update wiki accordingly.
No action neeeded if we're changing just a version bump.

In any other case Ask Legal to review and potentially adjust the EULA.

The request form can be found in innerweb, otherwise please contact Ciarran.

Current license is at https://github.com/openSUSE/skelcd-openSUSE/blob/master/license/license.txt
Wiki: https://en.opensuse.org/openSUSE:License

#### announce package freeze

send anounncement internally and externally to warn about the package freeze

#### enable countdown on www.opensuse.org

* Update the Leap release date in https://github.com/openSUSE/landing-page/blob/master/assets/js/countdown.js#L4
* Update the assets in a way described in the [readme](https://github.com/openSUSE/landing-page/#2-last-steps-build-and-test)

#### update OpenSUSE_Localization_Teams
Responsible: AdaLovelace

Ping everyone listed in https://en.opensuse.org/OpenSUSE_Localization_Teams to make sure translation teams are aware of the release and are available

Fix the links to the statistics.

#### sync :NonFree

We should sync :NonFree with Factory

#### update instlux files

the instlux files on the isos need to be updated to show the current version

