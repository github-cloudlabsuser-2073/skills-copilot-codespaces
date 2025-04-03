def calculator():
    """
    A simple calculator function that allows the user to perform basic arithmetic operations.

    The user can select from the following operations:
    1. Addition
    2. Subtraction
    3. Multiplication
    4. Division
    5. Percentage calculation

    The function prompts the user to input their choice of operation and the required numbers.
    It performs the selected operation and displays the result.

    Exceptions:
    - Handles invalid input (non-numeric values) by displaying an error message.
    - Prevents division by zero and notifies the user if such an attempt is made.

    Returns:
        None
    """
    print("Select operation:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Percentage")

    try:
        choice = int(input("Enter choice (1/2/3/4/5): "))
        if choice not in [1, 2, 3, 4, 5]:
            print("Invalid choice")
            return

        num1 = float(input("Enter first number: "))
        if choice == 5:
            print(f"The result is: {num1 / 100}")
        else:
            num2 = float(input("Enter second number: "))

            if choice == 1:
                print(f"The result is: {num1 + num2}")
            elif choice == 2:
                print(f"The result is: {num1 - num2}")
            elif choice == 3:
                print(f"The result is: {num1 * num2}")
            elif choice == 4:
                if num2 == 0:
                    print("Error: Division by zero is not allowed.")
                else:
                    print(f"The result is: {num1 / num2}")
    except ValueError:
        print("Invalid input. Please enter numeric values.")

if __name__ == "__main__":
    calculator()