/* eslint-disable no-console */
import url from 'node:url';
import path from 'node:path';

import { config as buildConfig } from './wdio.conf.js';

const dirname = url.fileURLToPath(new URL('.', import.meta.url));

buildConfig.capabilities = [{
    browserName: 'chrome',
    'goog:chromeOptions': {
        args: [
            '--disable-infobars',
            '--window-size=1280,800',
            '--no-sandbox',
            '--disable-gpu',
            '--disable-setuid-sandbox',
            '--disable-dev-shm-usage',
        ],
    },
}];

buildConfig.services = [
    [
        'static-server',
        {
            port: 8080,
            folders: [
                { mount: '/', path: path.join(dirname, 'demo-app') },
            ],
        },
    ],
];
buildConfig.path = '/';
buildConfig.beforeFeature = async () => {
    /**
     * check if static website is up and cancel if not
     */
    await (browser as WebdriverIO.Browser).url('/');
    const pageTitle = await (browser as WebdriverIO.Browser).getTitle();
};

if (process.env.CI) {
    buildConfig.outputDir = path.join(dirname, 'logs');
}

export const config = buildConfig;
