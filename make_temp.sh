#!/bin/bash

cd -- "${0%/*}"
script_dir="$(pwd)"

today="$(date +%Y%m%d)"
memo_dir="${script_dir}/${today}" # input your memo directory
read file_name
file="${memo_dir}/${file_name}.md"
if [ ! -f "${file}" ]; then
  template="${script_dir}/template"
  if [ -f "${template}" ]; then
    cat "${template}" > "${file}"
  else
    touch "${file}"
  fi
fi

vim ${file}
