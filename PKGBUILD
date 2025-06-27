# Maintainer: Gaël PORTAY <gael.portay@gmail.com>
pkgname=(helloworld)
pkgbase=github-workflows
pkgver=3
pkgrel=1
pkgdesc="My Github Workflows Experimentations"
arch=(x86_64)
url="https://github.com/gportay/$pkgbase"
license=(Unlicense)
depends=(glibc)
makedepends=(make)
source=("https://github.com/gportay/$pkgbase/archive/v$pkgver.tar.gz")
sha256sums=(SKIP)
validpgpkeys=()

build() {
	cd "$pkgbase-$pkgver"
	make
}

check() {
	cd "$pkgbase-$pkgver"
	make test
}

package_helloworld() {
	pkgdesc="Hello, World! From GitHub, and elsewhere."

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
