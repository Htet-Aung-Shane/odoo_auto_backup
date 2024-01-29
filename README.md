# Database auto backup for odoo

---

## Guideline
1. Clone the repository
2. Update the .pgpass with your credentials
3. Update odoo.sh with your desired paths
4. Make odoo.sh script file executable
5. Access permission for .pgpass to 640 
6. Test
7. Write Cron Job
## 1. Clone The Repository

Firstly, you can clone the repository or directly download the repository folder.

## 2. Update the .pgpass with your credentials

Open the folders with your Code Editor, IDE, text editor, or terminal. Update the .pgpass file with your credentials.

```shell
localhost:5432:db_mttech:mttech:password
```
## 3. Update odoo.sh with your desired paths

Update the odoo.sh file with your desired paths.

```shell
# Configuration
ODOO_DATABASE="db_mttech"
ODOO_USER="mttech"
FILESTORE_SOURCE="/home/has/.local/share/Odoo/filestore/$ODOO_DATABASE"
#this directory must be the folder path you want to keep the backup
BASE_DIR="/home/has/Documents/odoo-database-backup"
#this directory must be the repository path you clone
HOME="/home/has/Downloads/odoo-auto-backup"
```

## 4. Make odoo.sh script file executable

Grant executable permission to the odoo.sh file.

```shell
chmod +x odoo.sh
```
## 5. Access permission for .pgpass to 640 

And, grant the .pgpass file with 640.

```shell
chmod 640 .pgpass
```

## 6. Test

You can test the shell script with execute command

```shell
./odoo.sh
```
After the execution, check the backup directory, you configured at the odoo.sh .

## 7. Write Cron Jon
Firstly, you need to change to sudo user. And write cron job.

```shell
sudo su
crontab -e
```

20 means 20 minutes, 9 means 9 hours and /home/has/Downloads/project/bin/odoo.sh is the 'sh file path' .

```shell
20 9 * * * /home/has/Downloads/project/bin/odoo.sh > /tmp/cronjob.log 2>&1
```