#!/bin/bash

# Odoo Database Backup Script

# Configuration
ODOO_DATABASE="db_name"
ODOO_USER="db_user"
FILESTORE_SOURCE="/home/to/path/filestore/$ODOO_DATABASE"
BASE_DIR="/home/to/backup/path"
HOME="/home/odoo_auto_backup/path"
DATE=$(date +"%Y%m%d%H%M%S")
BACKUP_DIR=$BASE_DIR/$DATE
# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Set PGPASSFILE environment variable
export PGPASSFILE="$HOME/.pgpass"

# Backup the Odoo database
pg_dump -h localhost -U $ODOO_USER -d $ODOO_DATABASE -F c -b -v -f $BACKUP_DIR/$ODOO_DATABASE-$DATE.dump

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $BACKUP_DIR/$ODOO_DATABASE-$DATE.sql"
else
  echo "Backup failed"
fi

# Copy the filestore to the backup directory
cp -r "$FILESTORE_SOURCE" "$BACKUP_DIR/"

# Keep the last 3 backup folders and delete older ones
cd $BASE_DIR || exit
ls -t | tail -n +4 | xargs rm -rf

# Unset PGPASSFILE environment variable
unset PGPASSFILE

