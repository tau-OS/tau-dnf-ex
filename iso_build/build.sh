VERSION=36
DATE=$(date +"%Y%m%d")

rm -rf fedora-kickstarts
rm anaconda.log
rm tauOS-$VERSION-$DATE.iso

git clone https://pagure.io/fedora-kickstarts.git --branch=f$VERSION
cp tauos.ks fedora-kickstarts/tauos.ks
cd fedora-kickstarts
ksflatten -v, --config tauos.ks -o ./tauOS-Development-live-flat.ks --version f36

mock --init fedora-$VERSION-x86_64
mock --root fedora-$VERSION-x86_64 --install lorax-lmc-novirt nano sed
mock --root fedora-$VERSION-x86_64 --copyin tauOS-Development-live-flat.ks /
mock --root fedora-$VERSION-x86_64 --enable-network --isolation=simple --chroot "/sbin/livemedia-creator --ks /tauOS-Development-live-flat.ks --logfile /var/tmp/lmc-logs/livemedia-out.log --no-virt --resultdir /var/tmp/lmc --project tauOS-Development --make-iso --volid tauOS-Development-$VERSION-$DATE.n.0 --iso-only --iso-name tauOS-Development-$VERSION-$DATE.iso --releasever $VERSION --macboot"
mock --root fedora-$VERSION-x86_64 --copyout /var/tmp/lmc/tauOS-Development-$VERSION-$DATE.iso ..
mock --root fedora-$VERSION-x86_64 --copyout /var/tmp/lmc-logs/anaconda/anaconda.log ..

mock --root fedora-$VERSION-x86_64 --clean
cd ..
# rm -rf fedora-kickstarts
