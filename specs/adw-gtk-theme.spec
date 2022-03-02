%global dashedversion   1-3

Name:		adw-gtk-theme
Version:	1.3
Release:	1%{?dist}
Summary:	GNOME Shell Extension - Dock From Dash by fthx

License:	GPLv2+
URL:		https://github.com/lassekongo83/adw-gtk3
Source0:    https://github.com/lassekongo83/adw-gtk3/releases/download/v%{version}/adw-gtk3v%{dashedversion}.tar.xz

BuildArch:	noarch

%description
The default theme from libadwaita ported to GTK-3

Note that this is not a 100% accurate port.

%prep
%autosetup -cn adw-gtk3v%{dashedversion}

%install
mkdir -p %{buildroot}%{_datadir}/themes
cp -a adw-gtk3 %{buildroot}%{_datadir}/themes
cp -a adw-gtk3-dark %{buildroot}%{_datadir}/themes

%files
%{buildroot}%{_datadir}/themes/adw-gtk3
%{buildroot}%{_datadir}/themes/adw-gtk3-dark

%changelog
* Wed Mar 2 2022 PizzaLovingNerd
- Spec file built
