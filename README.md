## ==ТРЕБОВАНИЯ к вашему компьютеру (localhost)==
- ОС Windows 7, 10, MacOS, Linux
- Terraform 1.1.9 + (https://www.terraform.io/downloads)
- Visual Studio Code 1.61 + (https://code.visualstudio.com/)
- AWS Amazon аккаунт (https://aws.amazon.com/)
- MobaXterm 21.5 + (https://mobaxterm.mobatek.net/) или другой ssh client
- Аккаунт на DockerHub (https://hub.docker.com/)
- Аккаунт на GitHub (https://github.com/)
## ==Подготовка к работе и запуск==
- Создать в вашем Aws Amazon аккаунте key.pem (раздел EC-2 -> key pairs -> create key pair) и сохранить его на свой компьютер
- Клонировать данный репозиторий (https://github.com/mastermole0310/Jenkins_pipeline) в Visual Studio Code на свой компьютер
- Авторизоваться в AWS Amazon на вашем компьютере с помощью AWS CLI (https://cloudacademy.com/blog/how-to-use-aws-cli/)
- В файле main.tf в строке private_key указываем путь к вашему ключу, а в строке key_name его назание
- Выполнить команду terraform apply в Visual Studio Code на вашем компьютере
- Terraform создаст 2 инстанса (main_server, node1) на основе Linux Ubuntu, с установленным Jenkins на mian_server и Docker на node1
- Заходим в Jenkins по адресу (внешний ip адресс main_server:8080)
- Вводим необходимые данные для регистрации
- Создадим Node1:
  - Настроить Jenkins -> Управление средами сборки -> Новый узел -> Название узла (Permanent Agent)
  - Создать папку jenkins в директории /home/ubuntu/ на инстансе Node1
  - Заполняем необходимые поля (https://www.youtube.com/watch?v=Ynk2ylJASEI&t=780s)
- Настроим токен для Github:
  -  Запускаем на main_server команду ssh-keygen
  - pub_key добавляем в ваш аккаунт на Github, private_key копируем в Jenkins (Manage Credentials)
- Настроим токкен для Dockerhub:  
- Создаем токкен в Jenkins с помощью логина и пароля:
- Настроить Jenkins -> Manage Credentials -> Domains(global) -> Add Credentials.
- Устанавливаем docker pipeline plugin и перезапускаем Jenkins
- Создать Item -> Pipeline
- Создаем pipeline для запуска из репозитория Git:
  - в поле для SCM выбираем git и заполняем все необходимые поля
  - в поле Branch to Build прописываем /refs/heads/имя ветки
  - запускаем наш pipeline кпопкой "Собрать сейчас"
- В результате в вашем аккаунте на Dockerhub создастся docker_image с названием httpd_pipeline
## ==АВТОР==
- Smirnov Alexey

