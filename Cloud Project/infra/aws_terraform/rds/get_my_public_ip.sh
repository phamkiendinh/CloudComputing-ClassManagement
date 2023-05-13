#!/bin/bash
MY_PUBLIC_IP=$(curl -s ifconfig.me)

jq -n --arg my_public_ip "$MY_PUBLIC_IP" '{"my_public_ip":$my_public_ip}'