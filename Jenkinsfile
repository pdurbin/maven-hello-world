stage 'Compile'
node('master') {
    checkout scm
    // use for non multibranch: git 'https://github.com/amuniz/maven-helloworld.git'
    sh "mvn clean install -DskipTests"
    stash 'working-copy'
}
