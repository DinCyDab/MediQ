using MediQ.MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Controller
{
    class SearchController
    {
        DatabaseController dc = new DatabaseController();
        
        //Used for searching then returns the list of doctors
        //Like for example "Searching Juan"
        //It will yield "Juan Dela Cruz", "Juana Dela Cruz", Juanita Dela Cruz, "Johan Juan Dela Cerna"
        public List<Doctors> findDoctors(string input)
        {
            List<Doctors> list_of_doctors = null;

            string sql = $"SELECT * FROM Doctors " +
                         $"INNER JOIN Category ON Doctors.category_ID = Category.category_ID " +
                         $"WHERE first_name LIKE '%{input}%' OR " +
                         $"last_name LIKE '%{input}%' OR " +
                         $"category_name LIKE '%{input}%'";

            list_of_doctors = this.dc.findDoctors(sql);

            return list_of_doctors;
        }

        //Used for quick access of doctors recently searched
        public void addToHistory(int user_ID, int doctor_ID)
        {
            string sql = $"INSERT INTO Viewed(user_ID, doctor_ID) " +
                         $"VALUES({user_ID}, {doctor_ID})";

            this.dc.insertData(sql);
        }

        //Used to load the search history of user
        public List<History> loadHistory(int user_ID)
        {
            List<History> list_of_history = null;

            string sql = $"SELECT d.*, v.history_ID, c.* FROM Doctors d " +
                         $"JOIN ( " +
                         $"    SELECT doctor_ID, MAX(history_ID) AS history_ID " +
                         $"    FROM Viewed v " +
                         $"    WHERE user_ID = {user_ID} " +
                         $"   GROUP BY doctor_ID " +
                         $") v ON d.doctor_ID = v.doctor_ID " +
                         $"JOIN Category c ON d.category_ID = c.category_ID " +
                         $"ORDER BY v.history_ID DESC";

            list_of_history = this.dc.loadUserHistory(sql);

            return list_of_history;
        }

        //Used to load the search history of the user but returns the list of doctor objects
        //public List<Doctors> loadRecentSearched(int user_ID)
        //{
        //    List<Doctors> list_of_doctors = new List<Doctors>();
        //    List<History> list_of_history = loadHistory(user_ID);

        //    for(int i = 0; i < list_of_history.Count; i++)
        //    {
        //        Doctors doctor = new Doctors();
        //        string sql = $"SELECT * FROM Doctors " +
        //                     $"WHERE doctor_ID =  {list_of_history[i].doctor_ID}";
        //        list_of_doctors.Add(this.dc.loadDoctor(sql));
        //    }

        //    return list_of_doctors;
        //}

        public Doctors loadDoctor(int doctor_ID)
        {
            Doctors doctor = new Doctors();

            string sql = $"SELECT * FROM Doctors " +
                         $"INNER JOIN Category ON Doctors.category_ID = Category.category_ID " +
                         $"WHERE doctor_ID = {doctor_ID}";

            doctor = this.dc.loadDoctor(sql);

            return doctor;
        }
    }
}
