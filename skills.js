// function to convert fahrenheit to celsius
function fahrenheitToCelsius(fahrenheit) {
    // formula to convert fahrenheit to celsius
    let celsius = (fahrenheit - 32) * 5/9;
    return celsius;
}
//driver code
let fahrenheit = 100;
let celsius = fahrenheitToCelsius(fahrenheit);
console.log(`${fahrenheit}°F is equal to ${celsius.toFixed(2)}°C`);



 