#!/usr/bin/env bash
set -euo pipefail

ZONE="cloudflare"

# Ensure zone exists
firewall-cmd --get-zones | grep -q "^${ZONE}$" || {
  firewall-cmd --permanent --new-zone=${ZONE}
}

# Remove existing sources
for src in $(firewall-cmd --permanent --zone=${ZONE} --list-sources); do
  firewall-cmd --permanent --zone=${ZONE} --remove-source="$src"
done

# Add Cloudflare IPv4 ranges
curl -fsSL https://www.cloudflare.com/ips-v4 | while read -r ip; do
  firewall-cmd --permanent --zone=${ZONE} --add-source="$ip"
done

# Add Cloudflare IPv6 ranges
curl -fsSL https://www.cloudflare.com/ips-v6 | while read -r ip; do
  firewall-cmd --permanent --zone=${ZONE} --add-source="$ip"
done

firewall-cmd --reload
