namespace Quantum.Teleportation {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    
    operation Teleportation (sentMessage : Bool) : Bool {
        mutable receivedMessage = false;
        using (register = Qubit[3]){            //require 3 bits to communicate between Alice and Bob
            let message = register[0];// encoded message
            //All the messages starts from 0 if the message is true then we need to flip the message again to 0
            if(sentMessage){
                X(message);     
			}
            let alice = register[1];
            let bob = register[2];

            H(alice);
            CNOT(alice,bob);
                                        //indirectly message effects the bob because of entanglement
            CNOT(message, alice);
            H(message);

            let messageState = M(message);
            let aliceState =M(alice);

            if(messageState ==One)
            {
                Z(bob);     
			}
             if(aliceState ==One)
            {
                X(bob);     
			}
			if(M(bob) ==One)
            {
                set receivedMessage = true;
			}

            ResetAll(register);
		}
        return sentMessage;
    }
}
