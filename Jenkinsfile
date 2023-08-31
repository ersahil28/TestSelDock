pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Set Environment') {
            steps {
                sh 'call setenv.bat'
            }
        }
        stage('Build Jar') {
            steps {
                //sh
                sh "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //sh
                sh "docker build -t='ersahil28/selenium-docker' ."
            }
        }
        stage('Push Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'Famous@1991', usernameVariable: 'ersahil28')]) {
                    //sh
                    sh "docker login --username=${username} --password=${password}"
                    sh "docker push ersahil28/selenium-docker:latest"
                }
            }
        }
    }
}
