## ==ТРЕБОВАНИЯ к вашему компьютеру (localhost)==
- ОС Windows 7, 10, MacOS, Linux
- Terraform 1.1.9 + (https://www.terraform.io/downloads)
- Visual Studio Code 1.61 + (https://code.visualstudio.com/)
- AWS Amazon аккаунт (https://aws.amazon.com/)
- MobaXterm 21.5 + (https://mobaxterm.mobatek.net/) или другой ssh client
- Аккаунт на DockerHub (https://hub.docker.com/)
- Аккаунт на GitHub (https://github.com/)
## ==Подготовка к работе и запуск==
- Клонировать данный [репозиторий](https://github.com/mastermole0310/CI-CD-pipeline-for-website-using-AWS-EC2-and-Github-Actions)
- Авторизоваться в AWS Amazon на вашем компьютере с помощью AWS CLI (https://cloudacademy.com/blog/how-to-use-aws-cli/)
- Выполнить команду terraform apply в Visual Studio Code на вашем компьютере
- Terraform создаст инстанс (main_server) на основе Linux Ubuntu, с установленным Docker
- Создаем репозиторий на Dockerhub
- Заходим в наш репозиторий на Github и в Secrets создаем AWS_PRIVATE_KEY, DOCKERHUB_ACCESS_TOKEN, DOCKER_USERNAME, HOSTNAME (AWS), PORT (AWS), USER_NAME (AWS)
- Далее создаем новый Actions
- Копируем содержимое файла aws.yml в ваш workflow
- Actions создаст CI/CD pipeline для деплоя вашего приложения в AWS EC2
- Далее заходим в ваш аккаунт AWS → Route 53 → Hosted zones → Record name
- Выбираем Record name (например www.domain-name.com) и выбираем его значение
- Вводим его в браузер и на экране увидим надпись "Hello, world"

![website](https://user-images.githubusercontent.com/95876810/183314382-89fa82c0-ba2a-466c-87d0-b8204ce8254d.jpg)

## ==Примечание==
Domain name был создан вручную  в виду невозможности обновления провайдера Terraform AWS (даже с использованием VPN) (https://github.com/hashicorp/terraform/issues/24082)
## ==АВТОР==
- Smirnov Alexey
