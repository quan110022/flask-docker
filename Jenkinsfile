pipeline {
  agent any
  stages {
    stage("clone") {
      steps {
        git 'https://github.com/quan110022/flask-docker.git'
       }        
    }
    stage("build") {
      
      steps {
        withDockerRegistry(credentialsId: 'docker-hub-test-build', url: 'https://index.docker.io/v1/') {
          sh 'docker build -t 260899/flask-images .'
          sh 'docker push 260899/flask-images'
         }
      }        
    }
    stage("deploy") {
      steps {
        sshagent(['ssh-private']) {
            sh "ssh -o StrictHostKeyChecking=no -l cloudbees 192.168.75.65 './deploy.sh'"
        }
      }        
    }
  }
}

