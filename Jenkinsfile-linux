pipeline {
    agent any
    stages {
        stage('compile') {
	   steps {
                echo 'compiling..'
		git url: 'https://github.com/nakul10795/Edureka_Project.git'
		sh script: 'mvn compile'
           }
        }
        stage('codereview-pmd') {
	   steps {
                echo 'codereview..'
		sh script: 'mvn -P metrics pmd:pmd'
           }
	   post {
               success {
                   pmd canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/pmd.xml', unHealthy: ''
               }
           }		
        }
        stage('unit-test') {
	   steps {
                echo 'codereview..'
		sh script: 'mvn test'
           }
	   post {
               success {
                   junit 'target/surefire-reports/*.xml'
               }
           }			
        }
        
	stage('package') {
	   steps {
                echo 'metric-check..'
		sh script: 'mvn package'	
           }		
        }
    }
}
