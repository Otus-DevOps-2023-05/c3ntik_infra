terraform {
  required_version = ">= 0.13"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "> 0.35"
    }
  }
}

provider "yandex" {
  #token     = "y0_AgAAAAANJr6WAATuwQAAAADmq4pZXPPDE8YWQXS9YaINpZLpCjTwxtA"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

#provider "yandex" {
#  #token     = "y0_AgAAAAANJr6WAATuwQAAAADmq4pZXPPDE8YWQXS9YaINpZLpCjTwxtA"
#  service_account_key_file = "/home/c3nt/.config/yandex-cloud/key.json"
#  cloud_id  = "b1gi8rea67r233k0htdp"
#  folder_id = "b1gi8rea67r233k0htdp"
#  zone      = "ru-central1-a"
#}

resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = "fd8cmoapd8bun0tia2ug"
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = "e9bliv6sqtuf7647rnrv"
    nat       = true
  }

  metadata = {
    ssh-keys = "otus:${file("/home/c3nt/.ssh/otus.pub")}"
  }

  connection {
    type  = "ssh"
    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("/home/c3nt/.ssh/otus")
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }

}
