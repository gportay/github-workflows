Name:           github-workflows
Version:        11
Release:        1
Summary:        My Github Workflows Experimentations

License:        Unlicense
URL:            https://github.com/gportay/%{name}
Source0:        https://github.com/gportay/%{name}/archive/v%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make

%description
My Github Workflows Experimentations.


%package helloworld
Summary: My Github Workflows Experimentations

%description helloworld
Hello, World!
From GitHub, and elsewhere.


%prep
%setup -q


%build
%make_build


%install
%make_install PREFIX=/usr


%files helloworld
%license LICENSE
%doc README.md
%{_bindir}/helloworld


%changelog
* Sun Jan 11 2026 Gaël PORTAY <gael.portay@gmail.com> - 11
- New release.
* Wed Jan 07 2026 Gaël PORTAY <gael.portay@gmail.com> - 10
- New release.
* Wed Dec 31 2025 Gaël PORTAY <gael.portay@gmail.com> - 9
- New release.
* Thu Jul 31 2025 Gaël PORTAY <gael.portay@gmail.com> - 8
- New release.
* Thu Jul 24 2025 Gaël PORTAY <gael.portay@gmail.com> - 7
- New release.
* Sat Jul 19 2025 Gaël PORTAY <gael.portay@gmail.com> - 6
- New release.
* Wed Jul 09 2025 Gaël PORTAY <gael.portay@gmail.com> - 5
- New release.
* Fri Jun 27 2025 Gaël PORTAY <gael.portay@gmail.com> - 4
- Initial release.
