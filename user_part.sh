#!/bin/bash

### We set up the user used to access to the vogsphere

mkdir -p ~/.ssh &&
cat >> ~/.ssh/config << EOF
Host vgs vgs.21-school.ru vgse vgse.21-school.ru vogsphere vogsphere.21-school.ru vogsphere-exam vogsphere-exam.21-school.ru
	User vogsphere
EOF

echo "user part finished, welcome in the freedom !"
