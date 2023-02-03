# Pile Of Nuts

## Description
A pile of nuts is in an oasis, across a desert from a town. The pile contains 'N' kg of nuts, and the town is 'D' kilometers away from the pile.

The goal of this problem is to write a program that will compute 'X', the maximum amount of nuts that can be transported to the town.

The nuts are transported by a horse drawn cart that is initially next to the pile of nuts. The cart can carry at most 'C' kilograms of nuts at any one time. The horse uses the nuts that it is carrying as fuel. It consumes 'F' kilograms of nuts per kilometer travelled regardless of how much weight it is carrying in the cart. The horse can load and unload the cart without using up any nuts.

Your program should have a function that takes as input 4 real numbers D,N,F,C and returns one real number: 'X'

Do not worry about drinking water, or other "real world" issues.

## Installation

In order to get the application running you need to do as follows:

- Make sure that you are using a ruby version which is definied in .ruby-version

- Execute: `bundle install`

## Usage

To experiment with that code, run `bin/console` for an interactive prompt:
You can create experience with the code, by getting a solution for one line:
```
#By one line:
Calculator.calculate(5,25,1,15)

#By multiple:
horse_drawn_cart = HorseDrawnCart.new(5,25,1,15) 
horse_drawn_cart.take_possible_nuts!
puts horse_drawn_cart.nuts_in_town
```
or multiple inputs:
```
# With pretty headers
Application.new(true).display_and_calculate_file("./data.txt")

# With D N F C X headers
Application.new.display_and_calculate_file("./data.txt")

# With D N F C X headers and custom spacing
Application.new(false, 10).display_and_calculate_file("./data.txt")
```

In case you just want the output without the console, use the app:
`INPUT_PATH="./data.txt" bin/app`
Keep in mind there is another environment variable, that can be used for nicer headers when displaying, to enable it, set it to any non-nil value:
`INPUT_PATH="./data.txt" PRETTY_HEADERS=true bin/app`
You can also try modifying the spacing:
`INPUT_PATH="./data.txt" SPACING=10 PRETTY_HEADERS=true bin/app`
## TEST

You can run tests by: `rspec`.

You can generate test coverage by setting the SIMPLECOV environment variable to true: `SIMPLECOV=true rspec` which should generate an overview of coverage to the 'coverage' folder.

## NOTES

I don't understand the part where it says the answer is greater than 0, even if nuts_used_per_transport > capacity. In this case I would need to remove the cost of transport on the first trip, but then have it again?

During the solvation of the problem I tried to design forward to reusable, easy to read, clean code and structure.

## Example
```
D                   N                   F                   C                   X
1000                3000                1                   1000                0
1000                7000                1                   1000                0
1000                100000              1                   1000                0
1111                3000                1                   1000                0
1000                3000                1                   1111                111
1111                3334                3                   4444                1
111                 3333                3                   2222                2334
111                 3333                3                   1000                1335
10000               1111111             3                   1111                0
10000               1111111             5                   1111                0
1000                1000000             2                   1000                0
1111                22222221            5                   3333                0
1000                12000               5                   3000                0
```
