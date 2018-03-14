#!/bin/bash
python acme_tiny.py --account-key ./account.key --csr ./domain.csr --acme-dir /var/www/challenge/ > ./vanderboom-me/signed.crt
cat ./vanderboom-me/signed.crt ./intermediate.pem > ./vanderboom-me/chained.pem
