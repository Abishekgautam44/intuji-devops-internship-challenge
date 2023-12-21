# php-hello-world
A simple hello-world for composer

 [![Latest Stable Version](https://github.com/silarhi/php-hello-world/workflows/Tests/badge.svg)](https://github.com/silarhi/php-hello-world/workflows/Tests/badge.svg)
 [![Latest Stable Version](https://poser.pugx.org/silarhi/hello-world/v/stable)](https://packagist.org/packages/silarhi/hello-world)
[![Total Downloads](https://poser.pugx.org/silarhi/hello-world/downloads)](https://packagist.org/packages/silarhi/hello-world)
[![License](https://poser.pugx.org/silarhi/hello-world/license)](https://packagist.org/packages/silarhi/hello-world)


[![SymfonyInsight](https://insight.symfony.com/projects/5d582202-1186-4ce7-82c7-c4d3a2c11807/big.svg)](https://insight.symfony.com/projects/5d582202-1186-4ce7-82c7-c4d3a2c11807)

Installation
------------

Install with composer
``` bash
composer require silarhi/hello-world
```

Run composer update
``` bash
composer update silarhi/hello-world
```

Usage
-----

``` php
require_once __DIR__ . '/vendor/autoload.php';

use Silarhi\Hello;

$hello = new Hello();
echo $hello->display() . "\n";
```

GitHub Webhook Configuration:
-----------------------------
Go to your GitHub repository settings.
Select Webhooks > Add a new webhook > Set Payload URL: 

```r
http://<ip-jenkins>:<port>/github-webhook 
(Example: http://192.168.1.95:8080/github-webhook/).
```

Set Content type to application/json.
Select the events you want to trigger this webhook.

Jenkins Plugin Installation:
----------------------------

Under Dashboard > Manage Jenkins > select Plugins
Search for GitHub and SSH in Available Plugins and install them.
Restart Jenkins after installing plugins.


Credentials Configuration:
--------------------------


Under Dashboard > ManageJenkins > select Credentials.
Click on Global under Domain.
Add Credentials: Kind - Username with Password.


Jenkins SSH Configuration:
--------------------------

Under Dashboard > Manage Jenkins > select System SSH remote hosts.
Enter the Hostname and Port (e.g., 22).
Select the credentials added recently. Apply the changes.

Create a Freestyle Project:
---------------------------
1 In the Jenkins Dashboard, click on New Item and give it a name.
2 Choose Freestyle Project.
3 Provide a description for the project.
4 Configure Source Code Management: Choose Git, enter the Repository URL, and set Branches to build (e.g., */main).
5 In Build Triggers, select "GitHub hook trigger for GITScm pooling."
6 In Build Steps, add the following script:
Copy code
```bash
#!/bin/bash
git clone https://github.com/Abishekgautam44/intuji-devops-internship-challenge.git
cd ./intuji-devops-internship-challenge
git pull
docker-compose up -d
```
Save and run your Jenkins job.

Now, your Jenkins job should be triggered automatically whenever changes are pushed to the GitHub repository.

