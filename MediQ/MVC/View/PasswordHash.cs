using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.View
{
    public static class PasswordHash
    {
        public static string Hash(string input)
        {
            char[] result = input.Select(c => (char)(c + 2)).ToArray();
            return new string(result);
        }
    }
}
