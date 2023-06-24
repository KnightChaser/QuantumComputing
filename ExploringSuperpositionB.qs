namespace ExploringSuperposition {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation GenerateSpecificState(alpha : Double) : Result {
        
        use q = Qubit();

        // Skewed probability of quantum bit
        // with α possiblity of 0, then 1-α possibility of 1. 
        // alpha parameter determined α.
        Ry(2.0 * ArcCos(Sqrt(alpha)), q);       // |ψ⟩=√α|0⟩+√1−α|1⟩

        Message("The qubit is in the desired state.");
        Message("");
        DumpMachine();

        Message("");
        Message("Your skewed random bit is:");

        return M(q);
    }
}

// PS D:\HelloQ#\ExploringSuperposition> dotnet run --alpha 0.25    
// The qubit is in the desired state.

// |0⟩      0.500000 +  0.000000 i  ==     *****                [ 0.250000 ]     --- [  0.00000 rad ]
// |1⟩      0.866025 +  0.000000 i  ==     ****************     [ 0.750000 ]     --- [  0.00000 rad ]

// Your skewed random bit is:
// Zero
