pipeline {
  agent any

  options {
    timeout(time: 2, unit: 'MINUTES')
  }

  environment {
    ARTIFACT_ID = "group1/webapp:${env.BUILD_NUMBER}"
  }
   stages {
   stage('Building image') {
      steps{
          sh '''
          docker build -t testapp .
             '''  
        }
    }
  
  
    stage('Run tests') {
      steps {
        sh "docker run testapp npm test"
      }
    }
   stage('Deploy Image') {
      steps{
        sh '''
        docker tag testapp 127.0.0.1:5000/grupo1/testapp
        docker push 127.0.0.1:5000/grupo1/testapp   
        '''
        }
      }
   stage('Vulnerability Scan - Docker ') {
        steps {
          sh "docker run -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image --severity CRITICAL 127.0.0.1:5000/grupo1/testapp"
            }
        }
    }
}