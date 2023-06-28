# c3ntik_infra
c3ntik Infra repository

Проверка подключения используя bastion host для сквозного подключения к ws1 host.


```
c3nt@c3ntik:~/.ssh$ ssh -i ~/.ssh/otus -A otus@158.160.112.58
Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.0-75-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 27 07:55:05 AM UTC 2023

  System load:  0.0               Processes:             132
  Usage of /:   54.9% of 7.79GB   Users logged in:       0
  Memory usage: 22%               IPv4 address for eth0: 172.16.72.31
  Swap usage:   0%
```


```
otus@bastion:~$ ssh 172.16.72.11
Welcome to Ubuntu 22.04.2 LTS (GNU/Linux 5.15.0-75-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jun 27 07:55:29 AM UTC 2023

  System load:  0.080078125       Processes:             127
  Usage of /:   54.9% of 7.79GB   Users logged in:       0
  Memory usage: 21%               IPv4 address for eth0: 172.16.72.11
  Swap usage:   0%
```

<<<<<<< HEAD
Работает.

=======
Работает.

bastion_IP = 51.250.92.72
someinternalhost_IP = 172.16.72.11
>>>>>>> c77dffa (add files setup vpn)
