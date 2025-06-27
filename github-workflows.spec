Name:           github-workflows
Version:        3
Release:        1%{?dist}
Summary:        My Github Workflows Experimentations

License:        Unlicense
URL:            https://github.com/gportay/%{name}
Source0:        https://github.com/gportay/%{name}/archive/v%{version}.tar.gz

BuildRequires:  gcc
BuildRequires:  make
#Requires:       

#BuildArch:      any
#
%description
My Github Workflows Experimentations.


%prep
%setup -q


%build
%make_build


%install
%make_install PREFIX=/usr


%files
%license LICENSE
%doc README.md
%{_bindir}/helloworld



%changelog
* Fri Jun 27 2025 gportay
- Initial release.
