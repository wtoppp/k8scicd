pipeline {
   environment {
   registry = "dock15/mytest"
   registryCredential = 'dockerhub_id'
   dockerImage = ''
   }

agent any

stages {
   stage('Cloning our Git') {
      steps {
      git branch: 'main', credentialsId: 'root-sshkey', url: 'git@192.168.31.110:root/project-one.git'
      }
   }

   stage('Building our image') {
      steps{
      script {
         dockerImage = docker.build "${registry}" + ":$BUILD_NUMBER"
         }
     }
   }

   stage('Deploy our image') {
      when {
              expression {
                currentBuild.result == null || currentBuild.result == 'SUCCESS' 
              }
            }
      steps{
      script {
         docker.withRegistry('',registryCredential) {
         dockerImage.push()
         }
      }
      }
   }

   stage('Cleaning up') {
      steps{
         sh "docker rmi $registry:$BUILD_NUMBER"
      }
   }
 }
}
