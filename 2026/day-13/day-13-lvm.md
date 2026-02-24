Commands Used 
------------------------------------
    df -h
    lsblk 
    lvm 
    pvs 
    pvcreate -L 
    vgs
    vgcreate 
    lvs 
    lvcreate 
    mkdir /mnt/resource
    mkfs.ext4 /dev/devops-vg/app-data
    mount /dev/devops-vg/app-data /mnt/resource
    lvextend -L 
    resize2fs
    df -h


Screenshot of the outputs 
--------------------------------------
    df -h
<img width="1315" height="396" alt="image" src="https://github.com/user-attachments/assets/1172f996-2748-423c-bbd3-fc91d469d0d5" />

    lsblk
<img width="1543" height="620" alt="image" src="https://github.com/user-attachments/assets/15e5c2f5-738e-44b4-8ddc-6c3d82b56870" />

What I learned 
-------------------------------------
1. How to create pv,vg,lv
2. How to create and mount a directory.
3. How to extend the space of lv using lvextend.
