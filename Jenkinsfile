ansiColor('xterm') {
properties([
    parameters([
        string(
            name: 'Environment'
        ),
        choice(
            choices: ['plan', 'apply', 'destroy'], 
            name: 'Terraform_Action'
        )])
])
pipeline {
    agent any
    stages {
        stage('Preparing') {
            steps {
                sh 'echo Preparing'
            }
        }
        stage('Git Pulling') {
            steps {
                git credentialsId: 'githubCred', branch: 'master', url: 'https://github.com/avishek9/DevOpsified_on_GCP.git'
            }
        }
        stage('Init') {
            steps {
                sh 'terraform -chdir=gke/ init'
            }
        }
        stage('Validate') {
            steps {
                sh 'terraform -chdir=gke/ validate'
            }
        }
        stage('Action') {
            steps {
                    script {    
                        if (params.Terraform_Action == 'plan') {
                            sh "terraform -chdir=gke/ plan -var-file=${params.Environment}.tfvars"
                        }   else if (params.Terraform_Action == 'apply') {
                            sh "terraform -chdir=gke/ apply -var-file=${params.Environment}.tfvars -auto-approve"
                        }   else if (params.Terraform_Action == 'destroy') {
                            sh "terraform -chdir=gke/ destroy -var-file=${params.Environment}.tfvars -auto-approve"
                        } else {
                            error "Invalid value for Terraform_Action: ${params.Terraform_Action}"
                        }
                }
            }
        }
    }
}
}