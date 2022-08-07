## ==ТРЕБОВАНИЯ к вашему компьютеру (localhost)==
- ОС Windows 7, 10, MacOS, Linux
- Terraform 1.1.9 + (https://www.terraform.io/downloads)
- Visual Studio Code 1.61 + (https://code.visualstudio.com/)
- AWS Amazon аккаунт (https://aws.amazon.com/)
- MobaXterm 21.5 + (https://mobaxterm.mobatek.net/) или другой ssh client
- Аккаунт на DockerHub (https://hub.docker.com/)
- Аккаунт на GitHub (https://github.com/)
## ==Подготовка к работе и запуск==
- Клонировать данный репозиторий (https://github.com/mastermole0310/test_task) в Visual Studio Code на свой компьютер и в ваш репозиторий на Github
- Авторизоваться в AWS Amazon на вашем компьютере с помощью AWS CLI (https://cloudacademy.com/blog/how-to-use-aws-cli/)
- Выполнить команду terraform apply в Visual Studio Code на вашем компьютере
- Terraform создаст инстанс (main_server) на основе Linux Ubuntu, с установленным Docker
- Создаем репозиторий на Dockerhub
- Заходим в наш репозиторий на Github и создаем новый Acnions
- Копируем содержимое файла aws.yml в ваш workflow
- Actions создаст CI/CD pipeline для деплоя вашего приложения в AWS EC2
- Далее заходим в ваш аккаунт AWS → Route 53 → Hosted zones → Record name
- Выбираем Record name (например www.domain-name.com) и выбираем его значение
- Вводим его в браузер и на экране увидим надпись "Hello, world"
## ==АВТОР==
- Smirnov Alexey

