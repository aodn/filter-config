#!groovy​

properties([pipelineTriggers([cron('H * * * *')])])

pipeline {
    agent none

    stages {
        stage('clean') {
            agent { label 'master' }
            steps {
                sh 'git clean -fdx'
            }
        }

        stage('sync') {
            agent {
                dockerfile {
                    additionalBuildArgs '--build-arg BUILDER_UID=${JENKINS_UID:-9999}'
                }
            }
            steps {
                sh 'aws s3 sync --delete . s3://${BUCKET} --exclude ".git/*" --exclude "*.md" --exclude ".gitignore" --exclude "Jenkinsfile" --exclude "Dockerfile"'
            }
        }
    }
}
