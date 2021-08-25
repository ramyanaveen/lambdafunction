pipeline {
    agent any
    tools {
      git 'git'
      terraform 'terraform'
    }

    stages {
        stage('git'){
            steps{
                git branch: 'main', credentialsId: 'githubcreds', url: 'https://github.com/ramyanaveen/lambdafunction.git'
            }
        }
        stage('changing directory') {
            steps{
                bat 'cd C:/Windows/System32/config/systemprofile/AppData/Local/Jenkins/.jenkins/workspace/lambda-terraform'
            }
        }
        stage('terraform init'){
            steps{
                withAWS(credentials: 'aws-user', region: 'ap-south-1'){
                bat 'terraform init -migrate-state'
                }
            }
        }
        stage('terraform apply'){
            steps{
                withAWS(credentials: 'aws-user', region: 'ap-south-1'){
                bat 'terraform apply --auto-approve'
            }
            }
        }
        }
    }