namespace QuantumRNG {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GenerateRandomBit() : Result {
        
        // Allocate a Qubit
        use q = Qubit();

        // Put the Qubit to superposition
        H(q);

        // It'll return 1 or 0 in 50% chances respectively.
        // Measure the Qubit and the overlapped status will be integrated into the clear one.
        return M(q);

    }

    // By the given range, it produces the unpredictable random number which range is in the given max limit.
    operation SampleRandomNumberInRange(max : Int, min : Int) : Int {

        mutable output = 0;
        repeat {
            mutable bits = [];
            for idxbit in 1..BitSizeI(max) {
                set bits += [GenerateRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max and output >= min);

        return output;

    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let min = 20482048;
        let max = 81928192;
        let randomNumber = SampleRandomNumberInRange(max, min);
        Message($"Sampling a random number between {min} and {max}: {randomNumber}");

        return 0;
    }

}
