namespace Quantum.Superposition {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    
    operation Superposition () : Result
    {
    mutable state = Zero;
        using(qubit= Qubit()){
            H(qubit);
            set state = M(qubit);

            Reset(qubit);
		}
        return state;
    }
}
