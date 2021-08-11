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
	}
}
