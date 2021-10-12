pipeline {
    agent any
    parameters {
        choice(
            name: 'BUILD_IMAGE',
            choices: ['flutter'],
            description: 'Select image for build' )
        choice(
            name: 'ACTION',
            choices: ['push', 'remove'],
            description: 'Push or remove image')
        string(
            defaultValue: '2.5.2',
            name: 'FLUTTER_TAG'
        )
    }
    stages {
                stage('Build docker') {
                     steps {
                           script {
                                if (env.BRANCH_NAME in ['master']) {
                                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: '54b1380a-4641-4437-8d49-1f2a09ec02ae', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                                        if (ACTION == 'push') {
                                            sh "bash docker_build.sh 1.0.${env.BUILD_NUMBER} $BUILD_IMAGE/Dockerfile mln-$BUILD_IMAGE $FLUTTER_TAG "
                                        } else {
                                            sh 'bash docker_remove.sh mln-$BUILD_IMAGE $FLUTTER_TAG  '
                                        }
                                    }
                                }
                           }
                    }
                }
    }
}