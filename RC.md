# RC
Calendar: ${Product}: RC build is done

#### update desktop file translations

* in weblate commit all pending changes

In desktop-file-translations:

* check 51-xml/download_data.sh
* export password
* run make
* verify and check

#### clean up build fails

be more agressive with build fails
- harass maintainers
- wipebinaries of failed packages after checking whatdependson
- wipebinaries of unresolvables
- file delete requests

#### set up redirects for repository structure on download.o.o

The paths referenced in this view:
https://api.opensuse.org/public/source/openSUSE:Leap:15.1/000product?view=productrepositories&product=openSUSE

should be reflected on http://download.opensuse.org/repositories/

Should be just a matter of installing some redirects.

#### eliminate duplicate binaries

packages with duplicate binaries need to be cleaned up as OBS has undefined behavior with those

https://build.opensuse.org/package/view_file/openSUSE:Leap:15.1:Staging/dashboard/duplicate_binaries?expand=1

#### make sure new maintenance packages end up in the release

maintenance probably released several packages that are new in the previous release. We need to make sure to collect them for the new release

#### enable OBS:Maintained attribute in :Update project

The :Update project needs to have

    <attributes>
    <attribute name="Maintained" namespace="OBS"/>
    <attribute name="BranchTarget" namespace="OBS"/>
    <attribute name="ApprovedRequestSource" namespace="OBS"/>
    </attributes>

=>

    $ osc meta attribute -c -a OBS:Maintained openSUSE:Leap:15.1:Update

And set update project:

    $ osc meta attribute -c -a OBS:UpdateProject -s openSUSE:Leap:15.1:Update openSUSE:Leap:15.1

#### remove beta marks
Blocks: remove README.beta from oss repository

* remove %_with_betatest from prjconf
* remove beta tag from openSUSE.product
* remove BETA=1 from openQA

#### remove README.beta from oss repository

Login to pontifex.infra.opensuse.org and remove README.BETA from /srv/ftp-{stage,prod}/pub/opensuse/distribution/leap/15.3/repo/oss/ directory so only README file remains.
If we keep README.BETA then user would receive still Beta warning during Leap RC build installation.
The ftp-prod is crucial, please double check there.

#### verify release counters for update

release number needs to be higher than in previous distributions. Make sure the are. mls knows how to.

#### openSUSE-EULAs up to date

devel:openSUSE:Factory/openSUSE-EULAs needs to be up to date to include all relevant licenses. Ie licenses that require explicit agreement via dialog by the user. That affects mostly packages in the openSUSE:Leap:15.0:NonFree project.

The sources are at github: https://github.com/openSUSE/openSUSE-EULAs

#### submit translation packages

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



#### submit translation packages

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


#### make counter.o.o/link point to new portal

https://counter.opensuse.org/link/ should point to https://en.opensuse.org/Portal:15.1?pk_campaign=counter


#### prepare get.opensuse.org

prepare get.opensuse.org for RC1

* https://github.com/openSUSE/get-o-o, _data/releases.yml, _data/15X.yml
* Sync with hellcp to deploy update when mirrors are ready

#### EULA review/update

Ask Legal to review and potentially adjust the EULA.

The request form can be found in innerweb

Current license is at https://github.com/openSUSE/skelcd-openSUSE/blob/master/license/license.txt

The year can be adjusted by means of sed before sending to Legal.

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

#### update openSUSE:Localization_guide
Responsible: AdaLovelace

Update https://en.opensuse.org/openSUSE:Localization_guide to document the Weblate workflow

When done, link it from https://en.opensuse.org/Portal:15.1

#### disable Factory submitter

disable the FCC submitter
