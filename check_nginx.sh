#!/bin/bash
if systemctl is-active --quiet nginx; then
    exit 0
else
    exit 1
fi
