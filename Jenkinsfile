pipeline {
    agent { node { label "terraform-node" } } 
    parameters {
                choice(name: 'deploy_choice', choices:['apply','destroy'],description:'The deployment type')
                  }
    environment {
        EMAIL_TO = 'fusisoft@gmail.com'
    }
    stages {
        stage('1.Terraform init') {
            steps {
                echo 'terraform init phase'
                sh 'terraform init'
            }
        }
        stage('2.Terraform plan') {
            steps {
                echo 'terraform plan phase'
                sh 'AWS_REGION=us-west-2 terraform plan'
            }
        }
        stage('3.Manual Approval') {
            input {
                message "Should we proceed?"
                ok "Yes, we should."
                parameters{
                    choice (name: 'Manual_Approval', choices: ['Approve','Reject'], description: 'Approve or Reject the deployment')
                }
            }
             steps {
                echo "Deployment ${Manual_Approval}"
            }          
        }
        stage('4.Terraform Deploy') {              
            steps { 
                echo 'Terraform ${params.deploy_choice} phase'  
                sh "AWS_REGION=us-west-2 terraform ${params.deploy_choice} --auto-approve"
            }
                }
        stage ('5. Email Notification') {
            steps {
                failure {
                    mail to: '${env.EMAIL_TO}',
                        cc : '${env.EMAIL_TO}',
                        subject: 'FAILED: Build ${env.JOB_NAME}', 
                        body: '''Build failed ${env.JOB_NAME} build no: ${env.BUILD_NUMBER}.\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}'''
                   }           
                success{
                    mail to: '${env.EMAIL_TO}',
                        cc : '${env.EMAIL_TO}',
                        subject: 'SUCCESSFUL: Build ${env.JOB_NAME}' 
                        body: '''Build Successful ${env.JOB_NAME} build no: ${env.BUILD_NUMBER}\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}'''
                   }               
                aborted{
                    mail to: '${env.EMAIL_TO}',
                        cc : '${env.EMAIL_TO}',
                        subject: 'ABORTED: Build ${env.JOB_NAME}' 
                        body: '''Build was aborted ${env.JOB_NAME} build no: ${env.BUILD_NUMBER}\n\nView the log at:\n ${env.BUILD_URL}\n\nBlue Ocean:\n${env.RUN_DISPLAY_URL}'''
                }
            }
        }
    }        
}   
