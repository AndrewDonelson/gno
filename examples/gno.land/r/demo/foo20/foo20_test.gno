package foo20

import (
	"std"
	"testing"

	"gno.land/r/demo/users"
)

func TestReadOnlyPublicMethods(t *testing.T) {
	admin := users.AddressOrName("g1us8428u2a5satrlxzagqqa5m6vmuze025anjlj")
	manfred := users.AddressOrName("g1u7y667z64x2h7vc6fmpcprgey4ck233jaww9zq")
	unknown := std.Address("g1u0000000000000000000000000000000000000")

	type test struct {
		name    string
		balance uint64
		fn      func() uint64
	}

	// check balances #1.
	{
		tests := []test{
			{"TotalSupply", 10100000000, func() uint64 { return TotalSupply() }},
			{"BalanceOf(admin)", 10000000000, func() uint64 { return BalanceOf(admin) }},
			{"BalanceOf(manfred)", 100000000, func() uint64 { return BalanceOf(manfred) }},
			{"Allowance(admin, manfred)", 0, func() uint64 { return Allowance(admin, manfred) }},
			{"BalanceOf(unknown)", 0, func() uint64 { return BalanceOf(users.AddressOrName(unknown)) }},
		}
		for _, tc := range tests {
			if tc.fn() != tc.balance {
				t.Errorf("%s: have: %d want: %d", tc.name, tc.fn(), tc.balance)
			}
		}
	}

	// unknown uses the faucet.
	std.TestSetOrigCaller(unknown)
	Faucet()

	// check balances #2.
	{
		tests := []test{
			{"TotalSupply", 10110000000, func() uint64 { return TotalSupply() }},
			{"BalanceOf(admin)", 10000000000, func() uint64 { return BalanceOf(admin) }},
			{"BalanceOf(manfred)", 100000000, func() uint64 { return BalanceOf(manfred) }},
			{"Allowance(admin, manfred)", 0, func() uint64 { return Allowance(admin, manfred) }},
			{"BalanceOf(unknown)", 10000000, func() uint64 { return BalanceOf(users.AddressOrName(unknown)) }},
		}
		for _, tc := range tests {
			if tc.fn() != tc.balance {
				t.Errorf("%s: have: %d want: %d", tc.name, tc.fn(), tc.balance)
			}
		}
	}
}
