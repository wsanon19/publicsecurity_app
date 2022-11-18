pipeline {
	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	    }
	agent any
	stages {
		stage ("build gradle") {   
			steps {
				sh 'chmod 755 ./gradlew clean build -x test'
			}
		}
		stage ('Build docker image') {
			steps {
				sh ' docker build -t wsanon19/securityapp:latest .'
			}
		}
		stage('Login to dockerhub') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
		stage('Publish to dockerhub') {
			steps {
				sh 'docker push wsanon19/securityapp:latest'
			}
		}
		
		
    }
}
