pipeline {
    agent any
     tools {
        maven 'mvn'
    }
    environment {
        IMAGE_NAME = 'srinivasulu2004/repo-1'
        VERSION = "${BUILD_NUMBER}"
    }
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/srinivasulu2004/repo-1-java-jenkins.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$VERSION .'
            }
        }
        stage('Push Image') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub', url: '']) {
                    sh 'docker push $IMAGE_NAME:$VERSION'
                }
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run --name container1 -d -p 8002:8080 $IMAGE_NAME:$VERSION'
            }
        }
    }
}

