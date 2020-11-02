# Hands on Checkpoints

## Connectivity check
`ansible all -m ping`
Returns pong

## Database installation
* `sudo systemctl status mysql.service`
   service should be active
- `sudo mysql -u db_user -p`
- `use employee_db;`
- `show tables;`
- Do select * from table. It should show the data inserted.

## Run Flask app 
`FLASK_APP=app.py flask run --host=0.0.0.0`
This is not suitable for production.

    http://<IP>:5000                            => Welcome
    http://<IP>:5000/how%20are%20you            => I am good, how about you?
    http://<IP>:5000/read%20from%20database     => JOHN
