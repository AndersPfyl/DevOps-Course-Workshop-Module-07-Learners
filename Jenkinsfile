pipeline {
    agent none
    stages {
        stage('Back-End Build and Test') {
            agent {
                docker { image 'mcr.microsoft.com/dotnet/sdk:5.0' }
            }
            environment {
                DISABLE_AUTH = 'true'
                DOTNET_CLI_HOME = "/tmp/DOTNET_CLI_HOME"
            }
            steps {
               sh 'pwd'
               sh 'dotnet build'
               sh 'dotnet test'
            }
        }
        stage('Front-End Build and Test') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                dir('DotnetTemplate.Web') {
                    sh 'npm i'
                    sh 'npm run build'
                    sh 'npm run lint'
                    sh 'npm t'
                }
            }
        }
    }
}