pipeline {
  agent {
    kubernetes {
      yaml """
apiVersion: v1
kind: Pod
metadata:
          labels:
            label: mylabel
spec:
  # Use service account that can deploy to all namespaces
  containers:
 
  - name: docker
    image: docker:latest
    command:
    - cat
    tty: true
    volumeMounts:
    - mountPath: /var/run/docker.sock
      name: dockersock
  volumes:
    - name: dockersock
      hostPath:
        path: /var/run/docker.sock
    - name: jenkins-data
      persistentVolumeClaim:
          claimName: jenkins-pv-claim
    
"""
              }
   }
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
      stage('Building image') {
      steps {
        container('docker') {
          
           sh 'docker build -t my-java-app:latest .'
        }
      }
    }
    stage('Publish image to Docker Hub') {
          
            steps {
              container('docker') {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
           sh  'docker push zubairbhat722/myjavaimage:latest'
           
              }
        }
                  
          }
    }
    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "java.yaml", kubeconfigId: "mykubeconfigfile")
        }
      }
    }
  }  
     
    
  
}




