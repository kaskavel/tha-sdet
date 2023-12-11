import type { Selector } from 'webdriverio';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current selector value
 * @param  {String}   method  The method to use (add or set)
 * @param  {String}   value   The value to set the selector to
 * @param  {String}   selector Element selector
 */
export default async (key: string, selector: Selector) => {
    // Construct the environment variable key
    const environmentKey = `${key}`;

    // Get the corresponding value from the environment file
    const value = process.env[environmentKey];
    const command = 'addValue';
    console.log(value);
    // Check if the value is defined before using it
    if (value !== undefined) {
        // Set the value in the input field
        await $(selector)[command](value);
    } else {
        console.warn(`Value for ${environmentKey} is not defined in the environment file.`);
    }
};
