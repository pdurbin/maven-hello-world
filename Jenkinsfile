node('master') {

stage ("Checkout")
{
checkout scm
}
 stage ("Build")
  {
   bat 'echo %PATH%'
   bat 'cd my-app'
   bat 'C:\Users\ultri\Desktop\apache-maven-3.6.0\bin\mvn package'
  }
}

