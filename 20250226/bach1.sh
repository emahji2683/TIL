#!/bin/bash

path="/Users/a81906/TIL/20250226"
psql $(whoami) -d postgres -f "$path/table_making_museums.sql"
psql $(whoami) -d postgres -f "$path/change_area_pref.sql"
