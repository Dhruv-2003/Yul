// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Yul {
    function yul_let() public pure returns (uint z) {
        assembly {
            let x := 1
            z := 4
        }
    }

    function yul_if(uint x) public pure returns (uint z) {
        assembly {
            if lt(x, 10) {
                z := 99
            }
        }

        // No else
    }

    function yul_switch(uint x) public pure returns (uint z) {
        assembly {
            switch x
            case 1 {
                z := 10
            }
            case 2 {
                z := 20
            }
            default {
                z := 0
            }
        }
    }

    function yul_for_loop() public pure returns (uint z) {
        assembly {
            for {
                let i := 0
            } lt(i, 10) {
                i := add(i, 1)
            } {
                z := add(z, 1)
            }
        }
    }

    function yul_while_loop() public pure returns (uint z) {
        assembly {
            let i := 0
            for {

            } lt(i, 5) {

            } {
                i := add(i, 1) // increment
                z := add(z, 1)
            }
        }
    }

    function yul_revert(uint x) public pure returns (uint z) {
        assembly {
            if gt(x, 10) {
                revert(0, 0)
            }
        }
    }

    function yul_add(uint x, uint y) public pure returns (uint z) {
        assembly {
            z := add(x, y)
            if lt(z, x) {
                revert(0, 0)
            }
        }
    }

    function yul_mul(uint x, uint y) public pure returns (uint z) {
        assembly {
            switch x
            case 0 {
                z := 0
            }
            default {
                z := mul(x, y)
                if iszero(eq(div(z, x), y)) {
                    revert(0, 0)
                }
            }
        }
    }

    function yul_fixed_point_round(
        uint x,
        uint y
    ) public pure returns (uint z) {
        assembly {
            let half := div(y, 2)
            z := add(x, half)
            z := mul(div(z, y), y)
        }
    }
}
