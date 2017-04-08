pipeline {
  agent {
    docker {
      image 'maven:3.3.9-jdk-8'
    }
    
  }
  stages {
    stage('Initialize') {
      steps {
        sh '''echo PATH = ${PATH}
echo M2_HOME = ${M2_HOME}
cd my-app
mvn clean'''
      }
    }
    stage('Build') {
      steps {
        sh '''cd my-app
mvn -Dmaven.test.failure.ignore=true install'''
      }
    }
    stage('Report') {
      steps {
        junit 'my-app/target/surefire-reports/**/*.xml'
        archiveArtifacts 'target/*.jar'
      }
    }
  }
}