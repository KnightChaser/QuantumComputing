namespace QuantumEntanglement {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    // Until the desired status corresponds to the current target Qbit status, run a Qbit setting process
    operation SetQubitState(desired : Result, target : Qubit) : Unit {
        if desired != M(target) {
            X(target);
        }
    }

    // status
    @EntryPoint()
    operation TestBellState(count : Int, initial : Result) : (Int, Int, Int, Int) {
        mutable numOnesQ1 = 0;
        mutable numOnesQ2 = 0;

        // allocate the qubits
        use (q1, q2) = (Qubit(), Qubit());   
        for test in 1..count {
            SetQubitState(initial, q1);     // Set to the initial status given by an parameter input
            SetQubitState(Zero, q2);        // Just set to zero

            H(q1);                          // Applies the Hadamard transformation to a single qubit
            
            // Activate quantum entanglement. If q1 determines its status, it affects to q2 immediately
            // CNOT(q1, q2);
            Controlled X([q1], q2);

            // measure each qubit
            let resultQ1 = M(q1);            
            let resultQ2 = M(q2);           

            // Count the number of 'Ones':
            if resultQ1 == One {
                set numOnesQ1 += 1;
            }
            if resultQ2 == One {
                set numOnesQ2 += 1;
            }
        }

        // reset the qubits
        SetQubitState(Zero, q1);             
        SetQubitState(Zero, q2);
        

        // Return number of |0> states, number of |1> states
        Message("q1:Zero, One  q2:Zero, One");
        return (count - numOnesQ1, numOnesQ1, count - numOnesQ2, numOnesQ2 );

    }
        
}

// PS D:\HelloQ#\QuantumEntanglement> dotnet run --count=1000 --initial=0
// q1:Zero, One  q2:Zero, One
// (520, 480, 520, 480)
// PS D:\HelloQ#\QuantumEntanglement> dotnet run --count=1000 --initial=1
// q1:Zero, One  q2:Zero, One
// (525, 475, 525, 475)
