#!/bin/bash
sed -i "s/export const BASE_URL = 'https:\/\/kinantouch.com';/export const BASE_URL = typeof process !== 'undefined' \&\& process.env \&\& process.env.BASE_URL ? process.env.BASE_URL : (typeof import.meta !== 'undefined' \&\& import.meta.env \&\& import.meta.env.BASE_URL ? import.meta.env.BASE_URL : '\/techtouch.com-v2');/g" scripts/config/constants.js
