#!/bin/bash
SCRIPT_PATH=$(dirname $(readlink -f $0))
TOPLEVEL=$(dirname ${SCRIPT_PATH})
VERBOSE_FLAGS=
if [ "x${DEBUG}" != "x" ]; then
  VERBOSE_FLAGS="-vvv"
  set -e
fi

cd ${TOPLEVEL}
ansible-playbook "${TOPLEVEL}/playbooks/deploy-rock.yml" ${VERBOSE_FLAGS}
retVal=$?
if [ $retVal -eq 0 ]; then
  cat << 'EOF'
┌──────────────────────────────────────────────────────────────────────────────┐
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                       Thank you for installing:                              │
│                                                                              │
│                                                                              │
│                 :::::::..       ...       .,-:::::  :::  .                   │
│                 ;;;;``;;;;   .;;;;;;;.  ,;;;'````'  ;;; .;;,.                │
│                  [[[,/[[['  ,[[     [[,[[[          [[[[[/'                  │
│                  $$$$$$c    $$$,     $$$$$$        _$$$$,                    │
│                  888b "88bo,"888,_ _,88P`88bo,__,o,"888"88o,                 │
│                  MMMM   "W"   "YMMMMMP"   "YUMMMMMP"MMM "MMP"                │
│                          :::.    :::. .::::::. .        :                    │
│                          `;;;;,  `;;;;;;`    ` ;;,.    ;;;                   │
│                            [[[[[. '[['[==/[[[[,[[[[, ,[[[[,                  │
│                            $$$ "Y$c$$  '''    $$$$$$$$$"$$$                  │
│                            888    Y88 88b    dP888 Y88" 888o                 │
│                            MMM     YM  "YMmMY" MMM  M'  "MMM                 │
│                                                                              │
|                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
│                                                                              │
└──────────────────────────────────────────────────────────────────────────────┘
EOF

else
  exit $retVal
fi