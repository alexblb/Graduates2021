pipeline {
	agent any
	stages {
		stage("hello") {
			steps {
				echo 'Hello'
			}
		}
		stage("Clone Repo") {
			steps {
				git 'https://github.com/goxr3plus/Simplest-Spring-Boot-Hello-World'
			}
		}
		stage("Build"){
			steps{
				withMaven(maven: 'JenkinsMaven') {
					sh "mvn -B clean package"
				}
			}
		}
		stage("Download Dockerfile") {
			steps {
				sh "wget https://raw.githubusercontent.com/alexblb/Graduates2021/main/Dockerfile"
			}
		}
		stage("docker build") {
			steps {
				sh "docker build -t tomcat_grad . && docker save tomcat_grad > tomcat_grad.tar && scp -i /var/lib/jenkins/.ssh/id_rsa tomcat_grad.tar vagrant@192.168.1.112:/home/vagrant/"
			}
		}
	}
}
