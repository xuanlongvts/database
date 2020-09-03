-- 1) Connect to PostgreSQL database
    -- psql -d database -U user -W
    -- For example, to connect to dvdrental database under postgres user, you use the following command:
    -- psql -d dvdrental -U postgres -W

    -- If you want to connect to a database that resides on another host, you add the -h option as follows:
    -- psql -h host -d database -U user -W

    -- In case you want to use SSL mode for the connection, just specify it as shown in the following command:
    -- psql -U user -h host "dbname=db sslmode=require"

-- 2) Switch connection to a new database
    /*
    Once you are connected to a database, you can switch the connection to a new database under a user specified by user. 
    The previous connection will be closed. If you omit the user parameter, the current user is assumed.
    */
    -- \c dbname username

    -- The following command connects to dvdrental database under postgres user:
    -- \c dvdrental

-- 3) List available databases
    -- \l

-- 4) List available tables
    -- \dt

-- 5) Describe a table
    -- \d 

-- 6) List available schema
    -- \dn

-- 7) List available functions
    -- \df

-- 8) List available views
    -- \dv

-- 9) List users and their roles
    -- \du

-- 10) Execute the previous command
    SELECT version();
    -- Now, you want to save time typing the previous command again, you can use \g command to execute the previous command:
    -- psql executes the previous command again, which is the SELECT statement,.

-- 11) Command history
    -- To display command history, you use the \s command.
    -- \s
    -- If you want to save the command history to a file, you need to specify the file name followed the \s command as follows:
    -- \s filename
    -- exe: \s Downloads/postgres_data_store/command_exe.txt   to save all command to file

-- 12) Execute psql commands from a file
    -- \i filename
    -- exe: \i Downloads/postgres_data_store/excute_comm.txt

-- 13) Get help on psql commands
    -- \?
    -- To get help on specific PostgreSQL statement, you use the \h command.
    -- \h ALTER TABLE

-- 14) Turn on query execution time
    -- \timing
    -- select count(*) from film;
    -- You use the same command \timing to turn it off.

-- 15) Edit command in your own editor
    -- \e
    /*
    It is very handy if you can type the command in your favorite editor. To do this in psql, you \e command. 
    After issuing the command, psql will open the text editor defined by your EDITOR environment variable and place the most recent command 
    that you entered in psql into the editor.
    */

-- 16) Switch output options
    --  \a command switches from aligned to non-aligned column output.
    --  \H command formats the output to HTML format.

-- 17) Quit psql
    -- \q