# Alpha

#### add openqa upgrade tests to/from 15.1
Responsible: mgriessmeier

upgrade tests need to include 15.1

#### Setup 15.2 release notes

A branch for new distribution needs to be created in the release notes git and the package adjusted accordingly.

The tokens for OBS are in the factory-maintainer user. Botmaster has all accounts:
sudo docker exec -ti go-agent-repo-checker-3 sudo -i -u go

Instructions how to set up webhooks:
https://openbuildservice.org/help/manuals/obs-user-guide/cha.obs.source_service.html#sec.obs.sserv.github.com

#### submit new Factory packages to Leap
Responsible: rel-eng

for all packages that were added to Factory after the last leap release, set up https://build.opensuse.org/project/show/openSUSE:42:Factory-Candidates-Check to check build success and activate the https://github.com/openSUSE/osc-plugin-factory/blob/master/fcc_submitter.py

Make sure to talk to Bernhard to turn off the bug bot to avoid spamming bugzilla.

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


