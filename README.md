# github-workflows

[![Deploy Arch Linux package to GitHub Release](https://github.com/gportay/github-workflows/actions/workflows/pkg-package.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/pkg-package.yml)
[![Deploy Debian package to GitHub Release](https://github.com/gportay/github-workflows/actions/workflows/deb-package.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/deb-package.yml)
[![Deploy RPM package to GitHub Release](https://github.com/gportay/github-workflows/actions/workflows/rpm-package.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/rpm-package.yml)
[![DragonflyBSD-vm](https://github.com/gportay/github-workflows/actions/workflows/DragonflyBSD-vm.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/DragonflyBSD-vm.yml)
[![NetBSD-vm](https://github.com/gportay/github-workflows/actions/workflows/NetBSD-vm.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/NetBSD-vm.yml)
[![OpenBSD-vm](https://github.com/gportay/github-workflows/actions/workflows/OpenBSD-vm.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/OpenBSD-vm.yml)
[![FreeBSD-vm](https://github.com/gportay/github-workflows/actions/workflows/FreeBSD-vm.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/FreeBSD-vm.yml)
[![Makefile CI](https://github.com/gportay/github-workflows/actions/workflows/makefile.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/makefile.yml)
[![Sign CI](https://github.com/gportay/github-workflows/actions/workflows/sign.yml/badge.svg)](https://github.com/gportay/github-workflows/actions/workflows/sign.yml)

My Github Workflows Experimentations

## REQUIREMENTS

This assumes you have already a GPG key; otherwise, generate a new GPG key
following [that][generating-a-new-gpg-key] GitHub documentation.

## GENERATE GPG KEYS

This generates a standard key with one user-id, directly without the need to
answer a bunch of prompts at the exception of the passphrase. Otherwise, use
`--generate-key`. The key expires the 1st of January 2027.

	$ gpg --quick-generate-key "GitHub Workflows (GitHub Signing Key 2026) <github-workflows@github.com>" default default 20270101T000000
	We need to generate a lot of random bytes. It is a good idea to perform
	some other action (type on the keyboard, move the mouse, utilize the
	disks) during the prime generation; this gives the random number
	generator a better chance to gain enough entropy.
	We need to generate a lot of random bytes. It is a good idea to perform
	some other action (type on the keyboard, move the mouse, utilize the
	disks) during the prime generation; this gives the random number
	generator a better chance to gain enough entropy.
	gpg: revocation certificate stored as '/home/github-workflows/.gnupg/openpgp-revocs.d/0123456789ABCDEF0123456789ABCDEF01234567.rev'
	public and secret key created and signed.
	
	pub   ed25519 2025-12-31 [SC] [expires: 2027-01-01]
	      0123456789ABCDEF0123456789ABCDEF01234567
	uid                      GitHub Workflows (GitHub Signing Key 2026) <github-workflows@github.com>
	sub   cv25519 2025-12-31 [E]

Create a [repository variable][variable] named `PGP_KEY_NAME` and fill the
value with the key's fingerprint (`0123456789ABCDEF0123456789ABCDEF01234567`).

And, create a [repository secret][secret] named `PGP_PRIVATE_KEY_PASSPHRASE`
and fill the value with the key's passphrase.

## EXPORT PRIVATE KEY

This exports your workflow secret key in the ASCII armored file output format:

	$ gpg --export-secret-keys --armor "GitHub Workflows (GitHub Signing Key 2026) <github-workflow@github.com>"
	-----BEGIN PGP PRIVATE KEY BLOCK-----
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	(...)
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF
	=0123
	-----END PGP PRIVATE KEY BLOCK-----

Create a second [repository secret][secret] named `PGP_PRIVATE_KEY_BLOCK` and
fill the value with the secret key (i.e. the output of the command above,
including the block markers `-----BEGIN PGP PRIVATE KEY BLOCK-----` and
`-----END PGP PRIVATE KEY BLOCK-----`).

## SIGN PUBLIC KEY

This signs the public key with your faithful secret key:

	$ gpg --sign-key "GitHub Workflows (GitHub Signing Key 2026) <github-workflows@github.com>"
	
	sec  ed25519/0123456789ABCDEF
	     created: 2025-12-31  expires: 2027-01-01  usage: SC  
	     trust: ultimate      validity: ultimate
	ssb  cv25519/682FA24A5B3A31D0
	     created: 2025-12-31  expires: never       usage: E   
	[ultimate] (1). GitHub Workflows (GitHub Signing Key 2026) <github-workflows@github.com>
	
	
	sec  ed25519/B33D92BF9D68EFBC
	     created: 2025-12-31  expires: 2027-01-01  usage: SC  
	     trust: ultimate      validity: ultimate
	 Primary key fingerprint: 89AB CDEF 0123 4567  89AB CDEF 0123 4567 89AB CDEF
	
	     GitHub Workflows (GitHub Signing Key 2026) <github-workflows@github.com>
	
	This key is due to expire on 2027-01-01.
	Are you sure that you want to sign this key with your
	key "Gaël PORTAY <gael.portay@rtone.fr>" (2FA122CA0501CA71)
	
	Really sign? (y/N) y

And, this exports your workflow public key signed by your faithful secret key,
in the ASCII armored file output format:

	$ gpg --export --armor "GitHub Workflows (GitHub Signing Key 2026) <github-workflows@gmail.com>"
	-----BEGIN PGP PUBLIC KEY BLOCK-----
	
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDEF012345670123456789ABCDEF0123456789ABCDEF
	0123456789ABCDEF0123456789ABCDEF012345670123456789ABCDEF01234567
	89ABCDEF0123456789ABCDE=
	=0123
	-----END PGP PUBLIC KEY BLOCK-----

Create a last [repository secret][secrets] named `PGP_PUBLIC_KEY_BLOCK` and
fill the value with the public key (i.e. the output of the command above,
including the block markers `-----BEGIN PGP PUBLIC KEY BLOCK-----` and
`-----END PGP PUBLIC KEY BLOCK-----`).

## SEND PUBLIC KEY

This sends the workflow public key to the keyserver:

	$ gpg --send-keys 89ABCDEF0123456789ABCDEF0123456789ABCDEF

## RECEIVE PUBLIC KEY

Anyone may import public keys from the keyserver:

	$ gpg --recv-keys 8F3491E60E62695ED780AC672FA122CA0501CA71 99645A3DF5E76F51A7A54C06B33D92BF9D68EFBC
	gpg: key 0123456789ABCDEF: public key "GitHub Workflows (GitHub Signing Key 2026) <github-workflows@github.com>" imported
	gpg: key 2FA122CA0501CA71: public key "Gaël PORTAY <gael.portay@rtone.fr>" imported
	gpg: Total number processed: 2
	gpg:               imported: 2

## VERIFY FILE

This verifies the [signature][1] of [file][2]:

	$ gpg --verify github-workflows-10.tar.gz.sig 
	gpg: assuming signed data in 'github-workflows-10.tar.gz'
	gpg: Signature made Thu 08 Jan 2026 04:56:25 AM CET
	gpg:                using EDDSA key 99645A3DF5E76F51A7A54C06B33D92BF9D68EFBC
	gpg: Good signature from "Gaël PORTAY (GitHub Signing Key 2026) <gael.portay+github@gmail.com>" [unknown]
	gpg: WARNING: This key is not certified with a trusted signature!
	gpg:          There is no indication that the signature belongs to the owner.
	Primary key fingerprint: 9964 5A3D F5E7 6F51 A7A5  4C06 B33D 92BF 9D68 EFBC

[1]: https://github.com/gportay/github-workflows/releases/download/v10/github-workflows-10.tar.gz.sig
[2]: https://github.com/gportay/github-workflows/releases/download/v10/github-workflows-10.tar.gz
[generating-a-new-gpg-key]: https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
[secret]: https://github.com/gportay/github-workflows/settings/secrets/actions
[variable]: https://github.com/gportay/github-workflows/settings/variables/actions
