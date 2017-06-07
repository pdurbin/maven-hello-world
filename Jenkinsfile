pipeline {
    agent none 
    stages {
        stage('Example Build') {
            agent { docker 'maven:3-alpine' } 
            steps {
                echo 'Hello, Maven'
                sh 'mvn --version'
                sh 'cd my-app && mvn compile'
            }
        }
        stage('Example Test') {
            agent { docker 'openjdk:8-jre' } 
            steps {
                echo 'Hello, JDK'
                sh 'java -version'
                sh 'cd my_app && java -cp target/classes com.mycompany.app.App'
            }
        }
    }
    post {
        always {
            archive 'my-app/**'
        }
    }

}
