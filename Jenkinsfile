pipeline {
    agent any

    tools {
        maven "MAVEN"
        jdk "JDK"
    }

    stages {
        stage('Initialize'){
            steps{
                echo "PATH = ${M2_HOME}/bin:${PATH}"
                echo "M2_HOME = /opt/maven"
            }
        }
        stage('Build') {
            steps {
                dir("/var/lib/jenkins/workspace/maven demo pipeline/") {
                sh 'mvn -Dmaven.test.failure.ignore=true clean package'
                }
            
            }
        }
        stage('Build docker image') {
            steps {
                sh 'docker build -t my-java-app:latest .'
                
            
            }
        }
     }
    post {
       always {
          junit(
        allowEmptyResults: true,
        testResults: '*/test-reports/.xml'
      )
      }
   } 
}
