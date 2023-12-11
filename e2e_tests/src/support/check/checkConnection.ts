export default async () => {
    const connectionElement = $('[data-testid="limit"]');

    // Check if the connection element is displayed
    expect(await connectionElement).toBeDisplayed();
};
