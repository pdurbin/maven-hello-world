pipeline {
    agent none 
    stages {
        stage('Example Build') {
            agent { docker 'maven:3-alpine' } 
            steps {
                echo 'Hello, Maven'
                sh 'mvn --version'
                sh 'cd my-app && mvn compile'
                sh 'pwd && ls -al'
            }
        }
        stage('Example Test') {
            agent { docker 'openjdk:8-jre' } 
            steps {
                echo 'Hello, JDK'
                sh 'java -version'
                sh 'pwd && ls -al'
                sh 'cd my-app && java -cp target/classes com.mycompany.app.App'
            }
        }
    }
}
