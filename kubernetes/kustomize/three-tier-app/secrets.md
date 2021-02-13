# Secrets

## PostgreSQL deployment

* (done) DB admin credentials - owns, exposed to _PostgreSQL set-up/tear-down jobs_
* DB admin database - owns, for obfuscation, required?
* DB internal port - owns, exposed to _PostgreSQL service_, for obfuscation
* _other PG-specific settings for obfuscation_

## PostgreSQL service
* DB service bearings - owns, exposed to _PostgreSQL set-up/tear-down jobs_

## PostgreSQL set-up/tear-down jobs
* (done) Application user credentials - owns, exposed to _HTML content copying job_
* Application user DB name - owns, exposed to _HTML content copying job_

## HTML content copying job
does not own config

## NGINX deployment
* NG internal port, used by _NGINX service_
* _other NG-specific settings for obfuscation_

## NGINX service
* NG service bearings

## DB client
does not own config

## meta

