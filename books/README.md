# Asynchronous Programming - Codelab 11

Ridho Anfa'al_2341720222_TI-3I

## Lab 1
### Question 1
Add your nickname to titlethe app as an identity for your work.
![p1-s2](img/p1-s1.png)

### Question 2
Search for your favorite book title in Google Books, then replace the book ID with the variable pathin the code. To do this, simply access the URL in your browser, as shown in the image below. Then, try accessing the complete URI in a browser like this. If it displays JSON data, you've succeeded. Capture your output and write it in READMEyour lab report. Then, commit the file with the message " W11: Question 2. "
![p1-s2](img/p1-s2.png)

### Question 3
Explain the meaning of the code in step 5 and related to substringit catchError!
- The ElevatedButton's logic manages a data request lifecycle. Upon pressing the button, the getData() function is invoked, handling the resulting Future with .then() for success and .catchError() for failures. The success callback uses substring(0, 450) to truncate the response to prevent UI issues from excessive data. In case of an error, the catchError block updates the result variable with 'An error occurred' to prevent application crashes. setState() is called in both cases to refresh the user interface.

Capture your lab results as a GIF and attach it to the README. Then, commit the project with the message " W11: Question 3. "
![p1-s2](img/p1-s3.png)

## Lab 2
### Question 4
Explain the meaning of the code steps 1 and 2!
- In the _FuturePageState class, three asynchronous methods—returnOneAsync(), returnTwoAsync(), and returnThreeAsync()—are defined in Step 1. Each method returns an integer after a simulated delay of three seconds through the await Future.delayed command, which is a typical approach for simulating time-intensive operations without blocking the main application thread. Step 2 introduces the count() method, which orchestrates the execution of these methods in sequence. Each method is called using the await keyword, causing the function to pause until the respective Future completes. The returned integers are summed into a variable named total, which ultimately incurs a total waiting period of nine seconds. After all executions are complete, the setState() method is used to update the result variable and refresh the user interface with the final output string.

![p2-s4](img/p2-s4.gif)