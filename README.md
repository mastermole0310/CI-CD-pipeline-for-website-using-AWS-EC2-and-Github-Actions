Status of Last Build:<br>
<img src="https://github.com/mastermole0310/CI-CD-pipeline-for-website-using-AWS-EC2-and-Github-Actions/workflows/Publish Website/badge.svg?branch-main"><br>

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
- Terraform создаст инстанс (server) на основе Linux Ubuntu, с установленным Docker
- Создаем репозиторий на Dockerhub
- Заходим в наш репозиторий на Github и в Secrets создаем AWS_PRIVATE_KEY, DOCKERHUB_ACCESS_TOKEN, DOCKER_USERNAME, HOSTNAME (AWS), PORT (AWS), USER_NAME (AWS)
- Далее создаем новый Actions
- Копируем содержимое файла aws.yml в ваш workflow
- Actions создаст CI/CD pipeline для деплоя вашего приложения в AWS EC2
- Далее заходим в ваш аккаунт AWS → Route 53 → Hosted zones → Record name
- Выбираем Record name (в нашем случае dribble-getup.online)
- Вводим его в браузер и на экране увидим надпись "Hello, world"

![grible](https://user-images.githubusercontent.com/95876810/184141718-72dd3ded-78ba-4d23-96b4-292eaac463d8.jpg)

## ==АВТОР==
- Smirnov Alexey
