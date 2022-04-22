%packages
# Exclude unwanted groups that fedora-live-base.ks pulls in
-@dial-up
-@input-methods
-@standard
@^gnome
# Exclude unwanted packages from @anaconda-tools group
-gfs2-utils
-reiserfs-utils
%end