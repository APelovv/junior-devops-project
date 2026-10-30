#!/bin/bash

echo "Checking Nginx service..."

if systemctl is-active --quiet nginx; then
    echo "SUCCESS: Nginx service is running."
else
    echo "ERROR: Nginx service is not running."
    exit 1
fi

echo "Checking HTTP response..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 http://localhost)

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: HTTP response is 200."
else
    echo "ERROR: HTTP response is $HTTP_CODE."
    exit 1
fi

echo "All checks passed!"
