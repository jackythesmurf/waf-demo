## To run the demo
1. create ec2 instance in aws, and using the `ec2_init.sh` script as user data in aws
2. create a security group with inbound HTTP traffic on port 80 from anywhere
3. create a target group with ec2 instance as a target, listening on port 3000
3. create a ALB in your VPC, configure the ALB to use the security group and listen on HTTPS and routes traffic to the target group you created.
4. associate your ALB with the web ACL, and configure the rules on web ACL

## SQL Injection Vulnerability in Web Application

Demo an attacker exploits a vulnerable web application login functionality through SQL injection.

**The App's Vulnerability**

The application accepts user input for username and password during login. This input is directly embedded into a SQL query without proper validation or sanitization. An attacker can leverage this by injecting malicious code into the input fields.

**The Attack:**

The attacker injects the following query as username and password:
SQL

`' OR '1'='1`


## XSS Injection Vulnerability in Web Application

Demo a scenario where an attacker exploits a DOM-based XSS vulnerability in a web application's comment section.

**The App's Vulnerability:**

The application directly inserts user input into the HTML without proper sanitization. This allows attackers to inject malicious scripts that execute in the victim's browser.

**The Attack:**

The attacker injects the following script into the comment field:

`<img src="x" onerror="alert('malicious content can be added here')">`
