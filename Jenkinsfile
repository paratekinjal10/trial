pipeline {
    agent any
    tools{
        maven 'maven-3.9.1'
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

                    withSonarQubeEnv(installationName: 'sonar-server' , credentialsId: 'new-jen') {
                    sh 'mvn sonar:sonar'
                    }        

                }
            }
        }

        stage("Quality gate") {

            steps {
                timeout(time: 1, unit: 'HOURS'){
                    waitForQualityGate abortPipeline: true
                    }
                
                }
                
              script{

                    waitForQualityGate abortPipeline: false, credentialsId: 'new-jen'
                    }        

                }
            }
        }        
          
}
