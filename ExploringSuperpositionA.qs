namespace ExploringSuperposition {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation GenerateRandomBit() : Result {

        use q = Qubit();

        // Qubits initialized always start from zero
        Message("Initialized qubit:");
        DumpMachine();
        Message(" ");

        // Make it duplicated
        H(q);
        Message("Qubit after applying H:");
        DumpMachine();
        Message(" ");

        // After measurement, the bit determines its status
        let randomBit = M(q);
        Message("Qubit after the measurement:");
        DumpMachine();
        Message(" ");

        // Reset. Start from zero again
        Reset(q);
        Message("Qubit after resetting:");
        DumpMachine();
        Message(" ");

        return randomBit;

    }
}

// Initialized qubit:
// |0⟩      1.000000 +  0.000000 i  ==     ******************** [ 1.000000 ]     --- [  0.00000 rad ]
// |1⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
 
// Qubit after applying H:
// |0⟩      0.707107 +  0.000000 i  ==     ***********          [ 0.500000 ]     --- [  0.00000 rad ]
// |1⟩      0.707107 +  0.000000 i  ==     ***********          [ 0.500000 ]     --- [  0.00000 rad ]
 
// Qubit after the measurement:
// |0⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |1⟩      1.000000 +  0.000000 i  ==     ******************** [ 1.000000 ]     --- [  0.00000 rad ]
 
// Qubit after resetting:
// |0⟩      1.000000 +  0.000000 i  ==     ******************** [ 1.000000 ]     --- [  0.00000 rad ]
// |1⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]

// One
