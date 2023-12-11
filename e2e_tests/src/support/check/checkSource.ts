export default async () => {
    const connectionElement = $('[href=\'/sources\']');

    // Check if the connection element is displayed
    expect(await connectionElement).toBeDisplayed();
};
