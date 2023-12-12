export default async () => {
    // Check whether elements associated with an existing connection exist
    await delay(2000);
    const elementExists = await $('td.ant-table-cell').isExisting();

    // Check if any element exists
    if (elementExists) {
        console.log('Connection is enabled');
    } else {
        console.log('We will add a connection using an existing destination');
        // Click on setup tab and add existing destination to source
        const overviewTab = $('[data-node-key="Overview"]');
        await overviewTab.click();
        await delay(2000);
        const dropDownTrigger = $('.ant-dropdown-trigger');
        await dropDownTrigger.moveTo();
        const elements = $('[data-menu-id^="rc"][data-menu-id$="existing"]');
        await elements.click();
        const destination = $('.ant-radio-wrapper');
        await destination.click();
        const continueButton = $('.ant-btn-primary');
        await continueButton.click();
        await continueButton.click();
        await delay(2000);

    }
};

function delay(ms: number): Promise<void> {
    return new Promise(resolve => {
        setTimeout(resolve, ms);
    });
}
