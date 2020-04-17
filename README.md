# OpenStack Octavia Amphora Image

[![Build Status](https://travis-ci.org/osism/openstack-octavia-amphora-image.svg?branch=master)](https://travis-ci.org/osism/openstack-octavia-amphora-image)

## Download

A daily updated image in QCOW2 format is available at https://files.osism.de/octavia-amphora-haproxy-master.qcow2.

A monthly updated image in QCOW2 format is available at https://files.osism.de/octavia-amphora-haproxy-master-YYYY-MM.qcow2.
The last available image is always from the previous month. If it is February, the last available image
is ``2020-01``.

## Upload

```
$ pip3 install python-openstackclient
$ qemu-img convert octavia-amphora-haproxy-master.qcow2 octavia-amphora-haproxy-master.img
$ openstack --os-cloud octavia image create \
    --private \
    --disk-format raw \
    --file octavia-amphora-haproxy-master.img \
    --min-disk 2 \
    --min-ram 1024 \
    --property hw_disk_bus=scsi \
    --property hw_scsi_model=virtio-scsi \
    --property os_distro=ubuntu \
    --property os_version=18.04 \
    "Octavia Amphora Haproxy - master"
```

## References

* https://docs.openstack.org/diskimage-builder/latest/
* https://docs.openstack.org/octavia/latest/admin/amphora-image-build.html
* https://github.com/openstack/diskimage-builder
* https://github.com/openstack/octavia/tree/master/diskimage-create

## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Author information

This build wrapper was created by [Betacloud Solutions GmbH](https://www.betacloud-solutions.de).
