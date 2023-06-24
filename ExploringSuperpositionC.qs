namespace ExploringSuperposition {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;

    @EntryPoint()
    operation GenerateRandomNumber() : Int {

        // |ψ⟩ = a_0|000⟩+a_1|001⟩+...+a_7|111⟩
        // In a_i, it complies sum(a_i)^2 = 1, which are complex numbers.

        // Create 3 consecutive Qubits, will create 2^3 combinations.
        use qubits = Qubit[3];

        ApplyToEach(H, qubits);
        Message("The qubit register in a uniform superposition: ");
        DumpMachine();

        // Mesaure the 3 qubits array (We inspect the distribution of Qbit possiblities every epoch)
        mutable results = [];
        for q in qubits {
            Message(" ");
            set results += [M(q)];
            DumpMachine();              // In n-th epoch, the distribution of quantum bit
                                        // possiblity will dwindle by 1/2.
        }

        Message(" ");
        Message("Your random number is: ");
        return BoolArrayAsInt(ResultArrayAsBoolArray(results));

    }
}


// The qubit register in a uniform superposition: 
// |0⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |1⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |2⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |3⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |4⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |5⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |6⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]
// |7⟩      0.353553 +  0.000000 i  ==     ***                  [ 0.125000 ]     --- [  0.00000 rad ]

// |0⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |1⟩      0.500000 +  0.000000 i  ==     *****                [ 0.250000 ]     --- [  0.00000 rad ]
// |2⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |3⟩      0.500000 +  0.000000 i  ==     *****                [ 0.250000 ]     --- [  0.00000 rad ]
// |4⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |5⟩      0.500000 +  0.000000 i  ==     *****                [ 0.250000 ]     --- [  0.00000 rad ]
// |6⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |7⟩      0.500000 +  0.000000 i  ==     *****                [ 0.250000 ]     --- [  0.00000 rad ]

// |0⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |1⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |2⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |3⟩      0.707107 +  0.000000 i  ==     **********           [ 0.500000 ]     --- [  0.00000 rad ]
// |4⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |5⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |6⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |7⟩      0.707107 +  0.000000 i  ==     **********           [ 0.500000 ]     --- [  0.00000 rad ]

// |0⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |6⟩      0.707107 +  0.000000 i  ==     **********           [ 0.500000 ]     --- [  0.00000 rad ]
// |7⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]

// |0⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |1⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |2⟩      1.000000 +  0.000000 i  ==     ******************** [ 1.000000 ]     --- [  0.00000 rad ]
// |3⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |4⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |5⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |6⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]
// |7⟩      0.000000 +  0.000000 i  ==                          [ 0.000000 ]

// Your random number is:
// 2
