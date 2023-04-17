pipeline {
    agent any
    tools{
        maven 'maven-3.9.1'
    }
    
    stages {
        stage ('get code') {

            steps {
                git branch: 'main', url: 'https://github.com/paratekinjal10/trial'
            }
        }

        stage ('build') {

            steps {
                
                sh 'mvn clean package'
                
            }
        }

    }
}
