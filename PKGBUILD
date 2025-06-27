# Maintainer: Gaël PORTAY <gael.portay@gmail.com>
pkgname=github-workflows
pkgver=3
pkgrel=1
pkgdesc="My Github Workflows Experimentations"
arch=(x86_64)
url="https://github.com/gportay/$pkgname"
license=('Unlicense')
makedepends=(make)
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=(SKIP)
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
