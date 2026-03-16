# OpenStack Octavia Amphora Image

The images are rebuilt every day. Images with a `YYYYMMDD` marker (e.g. `octavia-amphora-haproxy-zed.20240304.qcow2`)
are also available for the last 30 days. The last available image of this type can be retrieved in a file `last-VERSION` (e.g. `last-zed`).

## 2025.2 (Flamingo)

* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2025.2.qcow2
* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2025.2.qcow2.CHECKSUM

## 2025.1 (Expoxy)

* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2025.1.qcow2
* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2025.1.qcow2.CHECKSUM

## 2024.2 (Dalmatian)

* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2024.2.qcow2
* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2024.2.qcow2.CHECKSUM

## 2024.1 (Caracal)

* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2024.1.qcow2
* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2024.1.qcow2.CHECKSUM

## 2023.2 (Bobcat)

* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.2.qcow2
* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.2.qcow2.CHECKSUM

## 2023.1 (Antelope)

* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.1.qcow2
* https://nbg1.your-objectstorage.com/osism/openstack-octavia-amphora-image/octavia-amphora-haproxy-2023.1.qcow2.CHECKSUM

## Upload

```
$ pip3 install python-openstackclient
$ qemu-img convert octavia-amphora-haproxy-2025.2.qcow2 octavia-amphora-haproxy-2025.2.img
$ openstack --os-cloud octavia image create \
    --community \
    --disk-format raw \
    --file octavia-amphora-haproxy-2025.2.img \
    --min-disk 2 \
    --min-ram 1024 \
    --property hw_disk_bus=scsi \
    --property hw_scsi_model=virtio-scsi \
    --property os_distro=ubuntu \
    --property os_version=22.04 \
    "OpenStack Octavia Amphora Haproxy 2025.2"
```

## References

* https://docs.openstack.org/diskimage-builder/latest/
* https://docs.openstack.org/octavia/latest/admin/amphora-image-build.html
* https://github.com/openstack/diskimage-builder
* https://github.com/openstack/octavia/tree/master/diskimage-create
