# OpenStack Octavia Amphora Image

[![Build status](https://zuul.services.betacloud.xyz/api/tenant/osism/badge?project=osism/openstack-octavia-amphora-image&pipeline=post)](https://zuul.services.betacloud.xyz/t/osism/builds?project=osism%2Fopenstack-octavia-amphora-image&pipeline=post&skip=0)


## Current images

### Zed

* https://swift.services.a.regiocloud.tech/swift/v1/AUTH_b182637428444b9aa302bb8d5a5a418c/openstack-octavia-amphora-image/octavia-amphora-haproxy-zed.qcow2
* https://swift.services.a.regiocloud.tech/swift/v1/AUTH_b182637428444b9aa302bb8d5a5a418c/openstack-octavia-amphora-image/octavia-amphora-haproxy-zed.qcow2.CHECKSUM

### 2023.1 (Antelope)

* https://swift.services.a.regiocloud.tech/swift/v1/AUTH_b182637428444b9aa302bb8d5a5a418c/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.1.qcow2
* https://swift.services.a.regiocloud.tech/swift/v1/AUTH_b182637428444b9aa302bb8d5a5a418c/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.1.qcow2.CHECKSUM

### 2023.2 (Bobcat)

* https://swift.services.a.regiocloud.tech/swift/v1/AUTH_b182637428444b9aa302bb8d5a5a418c/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.2.qcow2
* https://swift.services.a.regiocloud.tech/swift/v1/AUTH_b182637428444b9aa302bb8d5a5a418c/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.2.qcow2.CHECKSUM

## Old images

* https://minio.services.osism.tech/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.1.qcow2
* https://minio.services.osism.tech/openstack-octavia-amphora-image/octavia-amphora-haproxy-zed.qcow2
* https://minio.services.osism.tech/openstack-octavia-amphora-image/octavia-amphora-haproxy-yoga.qcow2
* https://minio.services.osism.tech/openstack-octavia-amphora-image/octavia-amphora-haproxy-xena.qcow2
* https://minio.services.osism.tech/openstack-octavia-amphora-image/octavia-amphora-haproxy-wallaby.qcow2
* https://minio.services.osism.tech/openstack-octavia-amphora-image/octavia-amphora-haproxy-victoria.qcow2

## Upload

```
$ pip3 install python-openstackclient
$ qemu-img convert octavia-amphora-haproxy-2023.1.qcow2 octavia-amphora-haproxy-2023.1.img
$ openstack --os-cloud octavia image create \
    --community \
    --disk-format raw \
    --file octavia-amphora-haproxy-2023.1.img \
    --min-disk 2 \
    --min-ram 1024 \
    --property hw_disk_bus=scsi \
    --property hw_scsi_model=virtio-scsi \
    --property os_distro=ubuntu \
    --property os_version=20.04 \
    "OpenStack Octavia Amphora Haproxy 2023.1"
```

## References

* https://docs.openstack.org/diskimage-builder/latest/
* https://docs.openstack.org/octavia/latest/admin/amphora-image-build.html
* https://github.com/openstack/diskimage-builder
* https://github.com/openstack/octavia/tree/master/diskimage-create
