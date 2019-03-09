node('master') {

stage ("Checkout")
{
checkout scm
}
 stage ("Build")
  {
   bat 'echo %PATH%'
   bat 'cd my-app && mvn package'
  }
}

