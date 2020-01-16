pipeline {
  environment {
    registry = "ffxxe/exam2"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/ffxxe/student-exam2.git'
      }
    }
    stage('Test') {
      steps {
        sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
        """
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build('ffxxe/exam2:flask')
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi ffxxe/exam2:flask"
      }
    }
  }
}
