Function TestSqlConnection
{
	[CmdletBinding()]
    param (
        $Server,
        $Username,
        $Password
    )

    $sqlConnection = New-Object System.Data.SqlClient.SqlConnection "Data Source=$Server;Initial Catalog=master;Persist Security Info=True;User ID=$Username;Password=$Password;MultipleActiveResultSets=True";
    $sqlConnection.Open();
    $sqlcmd = $sqlConnection.CreateCommand();
    $query = "SELECT name, database_id FROM sys.databases";
    $sqlcmd.CommandText = $query;
    $adp = New-Object System.Data.SqlClient.SqlDataAdapter $sqlcmd;
    $data = New-Object System.Data.DataSet;
    $adp.Fill($data) | Out-Null
    $data.Tables;
    $sqlConnection.Close();
}
