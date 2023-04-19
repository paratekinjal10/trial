pipeline {
    
    agent any
    
    tools{
        maven 'maven-3.9.1'
    }
    
    environment{
    
        registry = 'demokinjal/trial'
        registryCredential = 'demokinjal'

    }

    stages {
        stage ('Get code') {

            steps {
                git branch: 'main', url: 'https://github.com/paratekinjal10/trial'
            }
        }

        stage ('Build') {

            steps {
                
                sh 'mvn clean package'
                
            }
        }

        stage("Sonar quality check") {

            steps {

              script{

                    withSonarQubeEnv(installationName: 'sonar-server2' , credentialsId: 'jen2') {
                    sh 'mvn sonar:sonar'
                    }        

                }
            }
        }

        stage("Quality gate") {

            steps {
                script {
                    def qg = waitForQualityGate()
                    if (qg.status != 'OK') {
                        error "Pipeline aborted due to Quality Gate failure: ${qg.status}"
                    } 
                
                }
                        
            }
        }

        stage("Build docker image"){
    
            steps{
    
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }

            }

        }
    }        
}
