#!/usr/bin/env bash


dev=$(git rev-parse --show-toplevel) || exit $?
cd $dev && pwd || exit $?

for rc in ~/.svnrc $dev/.svnrc $dev/sources/.svnrc
do
  [ -f $rc ] && . $rc
done
[ "$1" ] && svn="$1"

if [ "$svn" = "" -a "$svn_projects_path" != "" ]
then
  plugin=$(basename $PWD)
  for folder in $plugin $(echo $plugin | sed "s/-dev$//")
  do
    check="$svn_projects_path/$folder"
    echo checking $check
    if [ -d "$check/.svn" ]
    then
      read -p "Use $check as sven repository? [y/N] " resp
      [ "$resp" = "y" ] && svn="$check" && break
    fi
  done
fi

[ "$svn" = "" ] && echo "missing svn repository path" >&2 && exit 1

release=$(echo $(grep -h "Version:" *.php | head -1 | cut -d : -f 2))
cd $svn && pwd || exit $?
ls -d tags/$release 2>/dev/null && echo "release $release already deployed" && exit

echo sync $release from $dev to $svn
rsync --delete -Wavz $dev/ $svn/trunk/ --exclude-from $dev/.distignore --exclude-from $dev/.wpignore --exclude assets/ || exit $?
rsync -Wavz $dev/assets/ $svn/assets/ || exit $?
rsync -Wavz trunk/ tags/$release/
svn add tags/$release/
svn status | grep "^\?" | while read f file
do
  svn add "$file"
done
svn status
echo "if result is ok execute:
cd $svn
svn ci -m \"version $release\""
