pipeline {
  agent any
  stages {
    stage('pull from git') {
      steps {
        echo 'pulling code from git'
        git(url: 'https://github.com/monicadommaraju3795/maven-hello-world.git', branch: 'master')
      }
    }
  }
}