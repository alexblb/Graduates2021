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
				git 'https://github.com/kliakos/sparkjava-war-example.git'
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
				sh "docker build -t tomcat_grad . && docker save tomcat_grad > tomcat_grad.tar && scp tomcat_grad.tar vagrant@192.168.1.112:/home/vagrant/; \
					ssh vagrant@192.168.1.112 'docker kill $(docker ps -q); docker image rm --force $(docker images -a | awk '{print $3}' | tail -n+2); \
					docker load < tomcat_grad.tar; docker container run -p 8080:8080 -d tomcat_grad'"
			}
		}
	}
}
