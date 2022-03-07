# TC-APP
Please read the Turkish explanation below.

### Prerequisites

* Nginx 1.13.8
* PHP 8
* MySQL 5.7
* Redis

### Docker Composer Configuration

Please open the `docker-compose.yml` file and set your output ports on the docker-compose.yml file for yourself.

### Installing TC-APP

```bash
$ cd /your_lacate_src
$ docker-compose up -d
```

### Preferred Env preferences

- Open the terminal and list container:

```bash
$ docker ps
```
Output like:
```
CONTAINER ID   IMAGE          COMMAND                  CREATED      STATUS      PORTS                               NAMES
6ca12000d383   mysql:5.7      "docker-entrypoint.s…"   3 days ago   Up 3 days   0.0.0.0:3306->3306/tcp, 33060/tcp   tc-mysql-1
1a34c8f431d5   nginx:1.13.8   "nginx -g 'daemon of…"   3 days ago   Up 3 days   0.0.0.0:81->80/tcp                  tc-nginx-1
462f0bf9567c   tc_php8        "docker-php-entrypoi…"   3 days ago   Up 3 days   0.0.0.0:9000->9000/tcp              tc-php8-1
36c962a9acbc   redis:alpine   "docker-entrypoint.s…"   3 days ago   Up 3 days   0.0.0.0:6380->6379/tcp              tc-redis-1
```

- And inspect one any service with name:

```bash
$ docker inspect tc-php8-1
```
- And find Network Getway IP:
```
"Gateway": "172.18.0.1",
```

- Open `project/.env` file and edit:

```dotenv
DB_HOST=172.18.0.1

REDIS_HOST=172.18.0.1
```

- And change your port numbers:

```dotenv
DB_PORT=3306

REDIS_PORT=6380

LOCAL_PORT=81
```
Note: `LOCAL_PORT` is `nginx` outport number.

- Finally, find your IPv4 IP and set:
```dotenv
GOOGLE_IOS_HOST=192.168.1.101
```
The reason for this is to prevent the `Connection Refused` error from api requests.


### DB configurations

Database is created automatically with `Docker`. If you want import `.sql` when
look at the `docs/mysql` and import sql files
or use laravel migration command.
Laraval artisan command is:

```bash
$ php artisan migrate
```

Load for dummy data:
```bash
$ php artisan db:seed
```

### Laravel Artisan command
If you want run artisan command when open the terminal and  cd application path:

```bash
$ docker exec -it tc-php8-1 bash
```

- Import to the data into database than run the cache commands sequentially,

```bash
$ php artisan cache:create_app
$ php artisan cache:create_os
$ php artisan cache:create_device
```
- OR;
  - [http://localhost:81/cache-os](http://localhost:81/cache-os)
  - [http://localhost:81/cache-app](http://localhost:81/cache-app)
  - [http://localhost:81/cache-device](http://localhost:81/cache-device)


- To check expired date subscriptions:
  - The situations(status) are `started`, `renewed`, `pending`.

```bash
$ php artisan tcapp:expiredsubs {status}
```
- Run for callback:
  - The situations(status) are `waiting`, `send-again`.

```bash
$ php artisan call:back {status}
```


---- 

### Açıklama

Bu challenge çözerken bir mobil araç üzerinden birden çok uygulama indirilip yönetilecek şekilde düşündüm. 
Bundan dolayı `devices`, `applications`, `operating_systems`, `device_to_app` ve `purchases` modelleri oluşturuldu.

Dil içinde bir tablo oluşturulabilirdi ama dil ile ilgili ekstra bir geliştirmeler istenmediğinden dahil etmedim.

Genel hikaye; bir mobil device üreticeye ait bir ürünü `Google Play` ve `IOS App Store` üzerinden indirmesi ile
başlayan bir sürecimiz var. İlk uygulama indirildiği zaman `Device ID(U_id)`, `Application ID (app_id)` ve uniq bir
`client-token` ile default kayıt oluşturuyoruz. Device'ı `devices` tablosuna, uygulamaları `applications` tablosuna kaydediyoruz.
Bir üreticinin birden fazla uygulaması olabileceği için ve bu ürünler tek bir device eklenebileceği için one2many 
olarak `device_to_app` tablosuna `u_id` ve `app_id` birlikte uniq bir index olacak şekilde ekleme yapıyoruz.

İndirilen uygulamalarda satın alma işlemleri içinde purchase tablosuna, gerekli doğrulamaları geçmesi durumunda 
bugünkü tarihe 1 yıl ekleyerek satın alma işlemini gerçekleşitiriyoruz.

İstenildiği zaman uygulamanın durumunu sorgulamak için `Check Subscription` end-pointine istekte bulunabiliyoruz.

Ayrıca expired-date geçen uygulamalar için cronlar çalıştırarak, duruma göre expire-date uzatılarak yenileme işlemi yapabilmekteyiz.

- Burada farklı senaryo oluşmaktadır;
  - `Renewed`ilk satın alma işlemimde `started` olarak başlayan durum yenileme işlemi başarılı bir şekilde tamamlanırsa
  - `Pending` rate-limit hatası alması durumunda
  - `Cancelled` satın alma başarısız olması durumunda

gerçekleşir.

Bu durumlarım hepsi command olarak tanımlanan cronlarla kontrol edilmektedir.

Callback cron olarak zamanlanmıştır. Yapısal olarak purchase ile aynı şekilde çalışmaktadır. Cronların el ile tetiklenmesi 
ve hangi cron neyi çalıştırdığı yukarda yukarda açıklanmıştır.

- Burada farklı senaryo oluşmaktadır;
  - `Waiting` satın alma işlemi sırasında statüsü değişen kayıtları temsil eder,
  - `Done` thirt-party end-point uygulamadan başaralı sonuç dönmesi durumunu temsil eder,
  - `SendAgain` thirt-party end-point başarısız bir sonuç dönmesi durumunda tekrar çalıştırışmak üzere set edilir

Raporlama için sadece basit bir sql dosyası oluşturlmuştur. `docs/report/report.sql` dosyası içinden bakılabilir.

API istekleri için `docs/postman` dosylarını kullabilirsiniz.

Anlaşılmayan bir durum varsa iletişime geçebilirsiniz.

Teşekkürler :)