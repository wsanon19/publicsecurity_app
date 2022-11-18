pipeline {
	environment {
		registry = "wsanon19/securityapp"
		registryCredential = 'dockerhub'
		dockerImage = ''
	    }
	agent any
	stages {
		stage ("build") {   
			steps {
				sh './gradlew clean build -x test'
			}
		}
		stage ('Build docker image') {
			steps {
				script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
				}
			}
		}
		stage ('Publish to dockerhub') {
			steps {
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
						
			steps {
				script {
					docker.withRegistry('http://registry:5000','' ) {
						dockerImage.push("$BUILD_NUMBER")
						dockerImage.push('latest')
					}
				}
			}
		}
    }
}
