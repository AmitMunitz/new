using System;
using System.Data;
using System.Data.OleDb;

public class AdoHelper
{
    private OleDbConnection conn;
    private OleDbCommand command;
    private OleDbDataAdapter adapter;

    public AdoHelper(string fileName)
    {
        string ConnectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\" + fileName);
        conn = new OleDbConnection(ConnectionString);
    }

    private DataSet GetDataSet(string tableName, string sqlQuery)
    {
        DataSet ds = new DataSet();
        OleDbDataAdapter dataAdapter = new OleDbDataAdapter(sqlQuery, this.conn);
        dataAdapter.Fill(ds, tableName);
        return ds;
    }

    public DataTable GeDataTable(string sqlQuery)
    {
        DataTable dt = new DataTable();
        OleDbDataAdapter tableAdapter = new OleDbDataAdapter(sqlQuery, this.conn);
        tableAdapter.Fill(dt);
        return dt;
    }

    public string GetPrintDataTableStr(string sqlQuery)
    {
        DataTable dt = this.GeDataTable(sqlQuery);
        string printStr = "<table border='1'>";
        printStr += "<caption>"+dt.TableName+"</caption>";
        printStr += "<tr>";
        foreach (DataColumn column in dt.Columns)
        {
           printStr += "<th>" + column.ColumnName.ToString() + "</th>";
        }
        printStr += "</tr>";
        foreach (DataRow row in this.GeDataTable(sqlQuery).Rows)
        {
            printStr += "<tr>";
            foreach (object item in row.ItemArray)
            {
                printStr += "<td>" + item.ToString() + "</td>";
            }
            printStr += "</tr>";
        }
        printStr += "</table>";

        return printStr;
    }
    //Insert/Update/Delete Queries
    public int ExecuteQueryOperation(string sqlQuery)
    {
        try
        {
            this.conn.Open();
            this.command = new OleDbCommand(sqlQuery, this.conn);
            int rowsAffected = this.command.ExecuteNonQuery();
            this.conn.Close();
            return rowsAffected;// returns number of rows affected
        } 
        catch (OleDbException exOLEDB)
        {
            //ole db exception
            //error collection sample 
            Console.WriteLine("----------------------------------------");
            for (int i = 0; i <= exOLEDB.Errors.Count - 1; i++)
            {
                Console.WriteLine($"Message {(i + 1)}: {exOLEDB.Errors[i].Message}");
                Console.WriteLine($"Native: {exOLEDB.Errors[i].NativeError.ToString()}");
                Console.WriteLine($"Source: {exOLEDB.Errors[i].Source}");
                Console.WriteLine($"SQL: {exOLEDB.Errors[i].SQLState}");
                Console.WriteLine("----------------------------------------");
            }
        }
        catch(InvalidOperationException exInvalidOperation)
        {
            Console.WriteLine("----------------------------------------");
            Console.WriteLine($"InvalidOperationException: {exInvalidOperation.Message}");
        }
        catch (Exception myException)
        {
            //other exception
            //error collection sample
            Console.WriteLine("----------------------------------------");
            Console.WriteLine(myException.Message);
        }
        return -1;
    }
}