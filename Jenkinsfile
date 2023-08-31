pipeline {
    // master executor should be set to 0
    agent any
    stages {
        stage('Build Jar') {
            steps {
                //sh
                bat "mvn clean package -DskipTests"
            }
        }
        stage('Build Image') {
            steps {
                //sh
                bat "docker build -t='ersahil28/selenium-docker' ."
            }
        }
        stage('Push Image') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'Famous@1991', usernameVariable: 'ersahil28')]) {
                    //sh
			        bat "docker login --username=${user} --password=${pass}"
			        bat "docker push ersahil28/selenium-docker:latest"
			    }
            }
        }
    }
}