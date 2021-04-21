# OpenStack Octavia Amphora Image

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
