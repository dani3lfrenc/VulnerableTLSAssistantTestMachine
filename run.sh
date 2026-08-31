#!/bin/bash

set -uo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

start_server() {
    local name="$1"
    local cmd="$2"

    echo -e "${GREEN}[+][+][+][+] STARTING ${name} [+][+][+][+]${NC}"
    if eval "${cmd}"; then
        echo -e "${GREEN}[+] ${name} started successfully${NC}"
    else
        echo -e "${RED}[!] Failed to start ${name}${NC}" >&2
        return 1
    fi
}

start_server "NGINX WITH OPENSSL VERSION 1.0.1u" "/usr/local/nginx-1.0.1u/sbin/nginx"
start_server "NGINX WITH OPENSSL VERSION 1.0.1a" "/usr/local/nginx-1.0.1a/sbin/nginx"
start_server "NGINX WITH OPENSSL VERSION 1.0.2l" "/usr/local/nginx-1.0.2l/sbin/nginx"
start_server "NGINX WITH OPENSSL VERSION 3.0.12" "/usr/local/nginx-3.0.12/sbin/nginx"
start_server "APACHE WEBSERVER" "/usr/local/apache2/bin/apachectl start"

sleep infinity
