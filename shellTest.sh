. shellTest.cnf

echo "whse batch started"
#select rows from database with the given condition by establishing a connection with the db using userid and password
echo "SELECT item_nbr, movement_status, storage_location FROM Received_Items where movement_status = 'pending'" | mysql $database -u $userid -p $password > $filename

if [ -f $filename ]
then
#setting host of ftp
echo "initiating file transfer"
scp $filename $USER@abcdef:/downloads/

else
        echo "no files to transfer"
fi

echo "whse batch completed"
