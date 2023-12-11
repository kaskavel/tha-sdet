export default async () => {
    // Select all elements that match the given selector --> Need to add a better selector here in FE
    const elementExists = await $('td.ant-table-cell').isExisting();

    // Check if any element exists
    if (elementExists) {
        console.log('Connection is enabled');
    } else {
        console.log('We will add a connection using an existing destination');
        // Click on setup tab and add existing destination to source
        const overviewTab = $('[data-node-key="Overview"]');
        await overviewTab.click();
        const dropDownTrigger = $('.ant-dropdown-trigger');
        await dropDownTrigger.moveTo();
        const elements = $('[data-menu-id^="rc"][data-menu-id$="existing"]');
        await elements.click();
        const destination = $('.ant-radio-wrapper');
        await destination.click();
        const continueButton = $('.ant-btn-primary');
        await continueButton.click();
        await continueButton.click();
    }
};
