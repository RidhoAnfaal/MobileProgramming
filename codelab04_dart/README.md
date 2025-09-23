# Practical Assignments

## 1. Please complete Practicals 1 to 5, then document your work with screenshots and explanations!

### Practical 1 : List Data Type Experiment
### Step 1 
- Type or copy the following program code into the function main().
    
    ![p1-s1](img/p1-s1.png)

### Step 2
- Please try executing the code in step 1. What happens? Explain!
    
    ![p1-s2](img/p1-s2.png)

    The code create a list [1,2,3], assert is used to check conditions, it doesn't print anything unless the condition is false. The program prints the length = 3, it prints the element at index 1 = 2, then it changes the element at index 1 from 2 to 1, and it prints the new value = 1.

### Step 3 
- Add the following program code, then try executing (Run) your code.
    
    ![p1-s3](img/p1-s3.png)

### Practical 2 : Data Set Type Experiment
### Step 1
- Type or copy the following program code into the function main().

    ![p2-step1](img/p2-s1.png)

### Step 2
- Please try running the code in step 1. What happens? Explain! Then, correct any errors.

    ![p2-s2.0](img/p2-s2.png)
    
    That code created a set in dart. In dart curly braces {} with values create a set, a set is a collection of unique items no duplicates. When we print a set dart will display it inside {} braces with elements separated by commas.

### Step 3
- Add the following program code, then try to execute (Run) your code.

    ![p2-s3.0](img/p2-s3.0.png)

    The ouput looked weird because, when we declared var names3 = {}; the dart infers it as a map not a set.

- What happened? If an error occurs, please correct it but keep the three variables. Add your name and student ID to both Set variables using two different functions: .add()and .addAll(). Remove the Map variable; we'll try that in the next lab.

    ![p2-s3.0](img/p2-s3.1.png)

    .add() function is to adds one element to a set, while .addAll() adds multiple elements at once.

### Practical 3 : Maps Data Type Experiment
### Step 1
- Type or copy the following program code into the function main()

    ![p3-s1.0](img/p3-s1.png)

### Step 2
- Please try executing (Run) the code in step 1 above. What happened? Explain! Then fix it if an error occurs.

    ![p3-s2.0](img/p3-s2.png)

    var gifts and var nobleGases are maps in dart, a map stores key value pairs, key are like labels and value are the data connected to those labels. gifts map keys are strings ('first', 'second', 'fifth') value are mixed types ('partridge' 'turtledoves', 1). nobleGases map keys are integer integers (2, 10, 18) values are also mixed: strings ('helium', 'neon') and an integer (2).

### Step 3
- Add the following program code, then try to execute (Run) your code.

    ![p3-s3.0](img/p3-s3.0.png)

    Those problems happens because the program created mhs1 and mhs2 maps but we never stored anything in them or printed them, dart warns that they are unused.

- Add your name and student ID elements to each of the variables above ( gifts, nobleGases, mhs1, and mhs2). Document the results and create a report! 

    ![p3-s3.0](img/p3-s3.1.png)
    ![p3-s3.1](img/p3-s3.2.png)

## 2. Create a program that displays prime numbers from 0 to 201 using Dart. When a prime number is found, display your full name and student ID number.

![assignment](img/assignment.png)

Code flow :
1. Loops through all numbers from 2 to 201
2. isPrime = true; assume it's prime.
3. Check if it can be divided evenly by any smaller number (other than 1).
4. If it can be divided then it's not prime.
5. If it can't be devided then it's prime
6. Whenever the number is prime it will print the number along with my name and student id (nim).