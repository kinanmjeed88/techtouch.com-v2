#!/bin/bash
find . -type f \( -name "*.html" -o -name "*.xml" -o -name "*.json" -o -name "*.ts" -o -name "*.tsx" -o -name "*.js" -o -name "*.jsx" \) \
    -not -path "*/node_modules/*" -not -path "*/\.git/*" -not -name "constants.js" | xargs sed -i 's|https://kinantouch.com|/techtouch.com-v2|g; s|http://kinantouch.com|/techtouch.com-v2|g; s|https://www.kinantouch.com|/techtouch.com-v2|g; s|http://www.kinantouch.com|/techtouch.com-v2|g; s|//techtouch.com-v2|/techtouch.com-v2|g'
