Name:           github-workflows
Version:        4
Release:        1%{?dist}
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
* Fri Jun 27 2025 Gaël PORTAY <gael.portay@gmail.com> - 4
- Initial release.
