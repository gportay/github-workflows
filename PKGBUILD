# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=(github-workflows-helloworld)
pkgbase=github-workflows
pkgver=4
pkgrel=1
pkgdesc="My Github Workflows Experimentations"
arch=(x86_64)
url="https://github.com/gportay/$pkgbase"
license=(Unlicense)
depends=(glibc)
makedepends=(make)
source=("$pkgbase-$pkgver::https://github.com/gportay/$pkgbase/archive/v$pkgver.tar.gz")
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

package_github-workflows-helloworld() {
	pkgdesc="Hello, World! From GitHub, and elsewhere."

	cd "$pkgbase-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
