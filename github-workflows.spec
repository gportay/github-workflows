Name:       github-workflows
Version:    3
Release:    1
Summary:    My Github Workflows Experimentations
License:    Unlicense

URL:        https://github.com/gportay/%{name}
Source0:    https://github.com/gportay/%{name}/archive/v%{version}.tar.gz

%description
My Github Workflows Experimentations.

%prep
# we have no source, so nothing here

%build
make

%install
make DESTDIR=%{buildroot} PREFIX=/usr

%files
/usr/bin/helloworld

%changelog
# let's skip this for now
