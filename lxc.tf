terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
    pm_tls_insecure = true
    pm_api_url = "https://192.168.1.7:8006/api2/json"
    pm_password = "lol911"
    pm_user = "terraform-prov@pve"
    pm_otp = ""
}

resource "proxmox_lxc" "lxc-test" {
    features {
        nesting = true
    }
    hostname = "terraform-new-container"
    network {
        name = "eth0"
        bridge = "vmbr0"
        ip = "dhcp"
        ip6 = "dhcp"
    }
    ostemplate = "local:vztmpl/ubuntu-22.04-standard_20.04-1_amd64.tar.gz"
    password = "rootroot"
    pool = ""
    target_node = "skynet"
    unprivileged = true

    rootfs {
    storage = "local-lvm"
    size    = "8G"
  }
}