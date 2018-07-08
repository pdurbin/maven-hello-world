stage 'Compile'
node('master') {
    checkout scm
    // use for non multibranch: git 'https://github.com/amuniz/maven-helloworld.git'
    sh "mvn clean install -DskipTests"
    
}


stage 'Test'
node('master') {
       sh "${mvnHome}/bin/mvn test -Diterations=10"
    }

