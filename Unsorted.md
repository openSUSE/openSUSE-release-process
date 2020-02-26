# Unsorted

#### Update prefers for nodejs in project config
Responsible: rel-eng

From Adam Mayer:

The Prefer: line in 15.2 project config should probably be nodejs12 and npm12 instead of others.

Max I'd prefer for rebuild to happen before we do any changes that could trigger yet another rebuild.
Do you agree with proposal from Adam?

#### Missing OSS debug repo for ports

Ports are missing OSS debug repo.

Initial report is here: https://bugzilla.opensuse.org/show_bug.cgi?id=1156011

Once fixed, additional steps should be added to the Leap checklist.


#### Add Repotype: staticlinks for Leap:15.2:ports:PowerPC or ARM project conf

Add "Repotype: staticlinks" for Leap:15.2:ports:PowerPC project conf (1)
to have current isos to refer to last published ones.
I do not know if we need all other lines as those in Leap 15.1 project conf

(1) https://build.opensuse.org/projects/openSUSE:Leap:15.2:PowerPC:ToTest/prjconf ,empty today
    http://download.opensuse.org/ports/ppc/distribution/leap/15.2/iso/?C=M;O=D
(2) https://build.opensuse.org/projects/openSUSE:Leap:15.1:PowerPC:ToTest/prjconf
    http://download.opensuse.org/ports/ppc/distribution/leap/15.1/iso/?C=M;O=D



I assume need to be done also for ARM subproject.

#### bootstrap ppc64le for Leap 15.2
Responsible: rel-eng

bootstrap ppc64le for Leap 15.2

now that related subproject (1) was created with closed issue#55226 (2)
need to do some bootrap to be able to generate images and isos.

I do not have details of required actions, is it documented somewhere ?
but for sure some missing files in (1) compared to ARM subproject.

(1) https://build.opensuse.org/project/show/openSUSE:Leap:15.2:PowerPC
(2) https://progress.opensuse.org/issues/55226 
(3) https://build.opensuse.org/project/show/openSUSE:Leap:15.2:ARM

#### add link to openSUSE project

osc meta prj openSUSE -e

    <link project="openSUSE:Leap:15.2:Update"/>


#### set up :Images subproject

set up the :Images subproject, including Containers: namespace. Use project copy as with main project

#### Make sure hot-patched change being upstreamed
Responsible: rel-eng

We've hot-patched change in the several packages, those change should go to upstream either to github or OBS.

#### Create openSUSE:Leap:15.2:



#### please add http://download.opensuse.org/ports/aarch64/distribution/leap/15.2/

Hi,

there should be some magic OBS publishing hooks for publishing Leap 15.2 to distribution/leap/15.2, and it looks those need to be also put in place
for openSUSE:Leap:15.2:ARM . could you please do that? There is currently an aarch64 distribution in place that is waiting to be published.

TIA,
Dirk



#### Create openSUSE:Leap:15.2:ARM
Responsible: rel-eng

Hi, 

please create a project  openSUSE:Leap:15.2:ARM and assign maintainership to me so that we can start bootstrapping the distribution and download paths..



