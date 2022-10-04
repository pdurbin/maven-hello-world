#!groovy
@Library('ws_ng_jenkins_commons') _

def alljob = JOB_NAME.tokenize('/') as String[]
def proj_name = alljob[1]
def serviceName
def git_commiter

pipeline {    
    //agent { label 'NG_Cloud_new' }
      //agent { label 'ng-dev-slave-container'  }
  	 // agent{ label 'ng-cicd-slave-container'}
            agent {
                kubernetes {
                    cloud "vb-cicd19"
                    defaultContainer 'buildtools'
                   yaml libraryResource('podTemplates/buildtools_mapped_docker2.yaml')
                }
            }
    options {
        timeout(time: 200, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '21', daysToKeepStr: '30', artifactDaysToKeepStr: '30'))
        timestamps()
    }
    environment {
        SHOULDBUILD  = 'true'
        MASTERBRANCH = 'false'
    }
    stages {
        stage('Init params') {
            steps {
                script {
		git_commiter=sh(returnStdout: true, script:"git --no-pager show -s --format='%an' $GIT_COMMIT").trim()
		echo git_commiter
                    def skip_ci = sh (script: "git log -1 --pretty=%B | grep '\\[ci-skip\\]*'", returnStatus: true)
                    println "skip_ci ========================================================= $skip_ci "

                    if (skip_ci == 0) {
                        echo ("This commit should be skipped... set SHOULDBUILD => false ")
                        SHOULDBUILD = 'false'
                    }
                    println "GIT_BRANCH ========================================================= ${GIT_BRANCH} "
                    if ("${GIT_BRANCH}" == "master" ) {
                        echo ("This is master branch set MASTERBRANCH == true ")
                        MASTERBRANCH = 'true'
                    }
                    println "SHOULDBUILD ========================================================= ${SHOULDBUILD} "
                    println "MASTERBRANCH   ========================================================= ${MASTERBRANCH} "
                }}}

        stage('Build MVN & docker'){
            when { expression { SHOULDBUILD == "true" }}
            steps {
                container("java11"){
                script {
                    println "call mvnBuildPush with proj_name=${proj_name}  =============================================  GIT_BRANCH = ${GIT_BRANCH} "
                    sh "java -version"
                    pom_ver = mvnBuildPush("$proj_name", "${GIT_BRANCH}","$git_commiter") 
                    println "mvnBuildPush function return pom version:: ${pom_ver} "  
                }
        }}}

        stage('call appVersionUpdate function'){
            when { expression { SHOULDBUILD == "true" &&  MASTERBRANCH =="true"  &&  proj_name != "ws-infra-DAL" &&  proj_name != "ws-ng-infra" &&  proj_name != "ws-dl-generic-webapi"   }}
            steps {
                script {
          echo "call appVersionUpdate function"
		  serviceName = appVersionUpdate ("$proj_name", "$pom_ver", "$git_commiter", "${COMMIT_ID}")
		  println "serviceName: ${serviceName}"
          println "gitCommit: ${COMMIT_ID}"
        }}}
       stage ('OWASP Dependency-Check Vulnerabilities and SAST by SonarQube') {
          when { expression { SHOULDBUILD == "true" &&  MASTERBRANCH =="true" }}
            steps {
                dependencyCheck additionalArguments: ''' 
                    -o "./" 
                    -s "./"
                    -f "ALL" 
                    --prettyPrint''', odcInstallation: 'Dep-Test-From-Github'

                dependencyCheckPublisher pattern: 'dependency-check-report.xml'
                withMaven(globalMavenSettingsConfig: 'ng-maven-settings', mavenLocalRepo: '~/.m2/repository', maven: 'apache-maven-3.6.0', tempBinDir: '') {
                   sh 'mvn -Psonar -Dsonar.sourceEncoding=UTF-8 org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
            }
        }

    }       
// post {    
    // failure {
        // office365ConnectorSend color: 'd00000', message: 'Build Failed', status: 'FAILED', webhookUrl: 'https://outlook.office.com/webhook/493b1b43-80ae-494f-ae88-6dafe3e56bd4@b2138363-79e4-41cd-b199-3ddde8dc7947/JenkinsCI/6416c9e7b3f34bc3b4f4911eeac093be/12e63298-162b-40b1-bb43-54da1ba21fd7'
    // }
  	// success {
        // office365ConnectorSend color: '05b222', message: 'Build Successful', status: 'SUCCESS', webhookUrl: 'https://outlook.office.com/webhook/493b1b43-80ae-494f-ae88-6dafe3e56bd4@b2138363-79e4-41cd-b199-3ddde8dc7947/JenkinsCI/78e8b238b4eb4d24a4afd5eedcc65a89/c3bd7a6b-0aaa-4de4-932c-d5ea37470472'
    // }
    // }
}
}
