using System;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.Teleportation
{
    class Driver
    {
        static void Main(string[] args)
        {
            var trues = 0;
            var equal = 0;
            var random = new Random();

            using (var qsim = new QuantumSimulator())
            {
                for (int i = 0; i < 1000; i++)
                {
                    var sentMessage = random.Next(2) == 0;
                    var receivedMessage = Teleportation.Run(qsim, sentMessage).Result;

                    if (receivedMessage)
                        trues++;
                    if (sentMessage == receivedMessage)
                        equal++;

                }
            }
            Console.WriteLine("Teleportation Result: ");
            Console.WriteLine($"\t True: {trues}");
            Console.WriteLine($"\t False: {1000 - trues}");
            Console.WriteLine($"\t Equal: {equal / 1000 * 100}");
            Console.ReadKey();
        }
    }
}