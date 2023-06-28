#!/bin/sh

filename='../../.env'
template='../../.env.example'

rm -rf ${filename}
touch ${filename}

file=$(cat ${template})

for key in ${file}; do
    read -p "${key}" value
    echo "${key}${value}" >> ${filename}
done
