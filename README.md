# SloveniaSkills 2024 - panoga Web development

## Ubuntu okolje

### Vzpostavitev okolja

```bash
git clone --recurse-submodules https://github.com/sloskill17/slo_sk17_2024.git
cd slo_sk17_2024
./linux-setup.sh
# Sledi navodilom
# Interaktivno nastavi nastavitve podatkovne baze
# Interaktvno nastavi nastavitve za phpMyAdmin
```

### Podatkovna baza

Zaženi podatkovno bazo:

```bash
sudo systemctl enable mariadb
sudo systemctl start mariadb
```

Podatkovna baza je dostopna na [http://localhost/phpmyadmin](http://localhost/phpmyadmin) pod pogojem, da je zagnan tud spletni strežnik Apache2.

### NodeJS

NodeJS aplikacija se nahaja znotraj repozitorija:

```bash
cd slo_sk17_2024
cd node

npm start
```

### PHP

Zaženi spletni strežnik:

```bash
sudo systemctl enable apache2
sudo systemctl start apache2
```

Vsebina je dostopna na [http://localhost](http://localhost). Webroot mapa je `/var/www/html`.

## Docker okolje
### Podatkovna baza

Podatkovno bazo MariaDB lahko zaženete z ukazom `sudo docker-compose -f mariadb.yaml up` (če se nahajate v korenski mapi repozitorija, v nasprotnem primeru popravite pot do *yaml* datoteke ali pa se premaknite z ukazom `cd` v ustrezno mapo). Po zagonu se lahko povežete s podatkovno bazo z orodjem MySQLWorkbench preko vrat 3306 ali pa preko brskalnika z orodjem phpMyAdmin, ki je na voljo na [http://localhost:3307](http://localhost:3307).

### NodeJS

Izvorno kodo urejajte znotraj mape `node/src`.

Zagon:

```bash
cd node
sudo docker-compose up
```

### PHP

Izvorno kodo urejajte znotraj mape `php/webroot`.

Zagon:

```bash
cd node
sudo docker-compose up
```
