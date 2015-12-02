#! /bin/sh -e
# tup - A file-based build system
#
# Copyright (C) 2015  Mike Shal <marfey@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Try to read from a !tup_variant file
. ./tup.sh

tmkdir build

cat > Tupfile << HERE
: foreach *.html |> !tup_variant |>
: file2.html |> cat file2.html > %o |> out.html
HERE
tup touch Tupfile file.html file2.html build/tup.config
update

eotup
