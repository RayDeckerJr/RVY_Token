import Principal "mo:base/Principal";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";



actor Token{

    var owner: Principal = Principal.fromText("ym72z-gqzeb-zhism-wuvlh-ixevh-qvgik-h4m3j-amifc-jstrd-bkala-sqe");
    var totalSupply : Nat = 1000000000;
    var symbol: Text = "RVY";

    var balances = HashMap.HashMap<Principal,Nat>(1,Principal.equal,Principal.hash);
    balances.put(owner, totalSupply);

    public query func balanceOf(who: Principal) :async Nat {
        let balance : Nat = switch (balances.get(who)){
            case null 0;
            case(?result) result;
        };

        return balance;
    };

    public query func getSymbol(): async Text {
        return symbol;
    }
    
}