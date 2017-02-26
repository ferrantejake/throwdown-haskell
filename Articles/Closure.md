# Closure – What Is It and How Does Haskell Utilize It #

**Fair warning:** _if you don’t like JavaScript, you’re out of luck. 
The examples in this article are in Haskell and JavaScript as we did
not employ statically nested functions in our previous courses with
C and Java. I am not sorry Matt._


## Review on scoping: ##

Thinking back to System Software for those who have taken it at this
point, we can recall that (for the example PM0 code) to access a variable
inside a statically nested function the variable being accessed must be in
the immediately availiable function scope or must be a member of a static
parent function. In Laymen’s terms, you cannot access a variable which is
not in your currently executing function unless it was mentioned in one of
parent functions calling it.

Let’s take for example the following JavaScript code:

```
// Function A is the static parent of B
function A() {

    // Some members of A
    int a, b, c;

    // This is statically nested within the function A
    function B() {

        // Some members of B
        int d, e;

        // Be can access members of A
        a = c + d;
    }

    // B is involked within A
    B();
}

```

For those familiar with this structure of statically nested functions, 
I hope this serves as a refresher at the very least. If you are having 
trouble understanding what is going on.. I'd recommend this as a reference:
[https://en.wikipedia.org/wiki/Nested_function](https://en.wikipedia.org/wiki/Nested_function)

Lets move on to closures..


## What is closure? ##
In programming terms, closure is a means of passing around a function
as a first-class citizen - in other words such languages that support
this feature enable functions to be passed as arguments. 

## Why is this useful? ##
### Lazy evaluation ###
The concept of lazy evaluation pretty much covers why closure is
important. Lazy evaluation is enabled by the ability to pass around a
function by reference. Lets talk about constructing the set integers from [1, oo]
Simply put, there no way to compute this and pass the result of such 
a computation around in a program. Closures allow us to pass the function
by reference and evaluate the result later.

## References: ##
- 2/4/2017 | http://stackoverflow.com/questions/36636/what-is-a-closure
