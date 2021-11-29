******************************
**      Instructions        **
******************************

The required steps for the database so use the following steps:

    1. Read the License.txt file's content fully

    2. Import the database structure from the Database folder using db.sql file.

        2.0 At first the .Net Core SDK version must be checked, to be sure you have the required to be able to use
            this web app
        2.1 See the connection strings in the loadConnectionString method in the Database folder's MySqlController.cs
        2.2 If you have to change it, that's on you and the decision is yours
        2.3 Keep in mind the License's content

	User creation
	-------------

		2.4 Check that the users are existing, if not then you have to create those
        	2.5 The user for booking, and contact features must to be allowed to run insert and to be able 
			to run process also
        	2.6 User for menu feature must be able to run select, and "run" a view, but also true for get view's content
	

	Run the fill up of the menuactive(used by the web app to display the menu)
	--------------------------------------------------------------------------

		2.7 Run the process called fill_active_menu. This will fill up the table, what is used by the web app, to 
			display the menu for the user(s).	 
        
	Verdict
	-------

		2.8 If nothing error, or problem occured then enjoy the web app


Thank you for using the sample .Net Core web app!

Please tell me your thoughts about the web app.