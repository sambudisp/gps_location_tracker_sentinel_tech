#!/bin/bash
export $(grep -v '^#' .env | xargs)

cat > ios/Flutter/Secret.xcconfig << EOF
MAPS_API_KEY=$MAPS_API_KEY
EOF

echo "✅ Secret.xcconfig generated"