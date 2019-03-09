node('master') {
 def MAVEN_HOME = tool MAVEN
 env.PATH="${MAVEN_HOME}/bin:$PATH"
stage ("Checkout")
{
checkout scm
}
 stage ("Build")
  {
   bat 'echo %PATH%'
   bat 'cd my-app'
   bat 'mvn package'
  }
}

