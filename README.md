# Database auto backup for odoo

---

## Guideline
1. Clone the repository
2. Update the .pgpass with your credentials
3. Update odoo.sh with your desired paths
4. Make odoo.sh script file executable
5. Access permission for .pgpass to 640 

## Clone The Repository

Firstly, you can clone the repository or directly download the repository folder.

## Update the .pgpass with your credentials

Open the folders with your Code Editor, IDE, text editor, or terminal. Update the .pgpass file with your credentials.

```shell
localhost:5432:db_mttech:mttech:password
```
## Update odoo.sh with your desired paths

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

## Make odoo.sh script file executable

Grant executable permission to the odoo.sh file.

```shell
chmod +x odoo.sh
```
## Access permission for .pgpass to 640 

And, grant the .pgpass file with 640.

```shell
chmod 640 .pgpass
```