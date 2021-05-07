const {deployContract, MockProvider} = require('ethereum-waffle')
const IpfsStorage = require('../build/IpfsStorage.json')
const { waffleJest } = require('@ethereum-waffle/jest')

expect.extend(waffleJest);

describe('BasicToken', () => {
    const [wallet] = new MockProvider().getWallets();
    let token;

    beforeEach(async () => {
        token = await deployContract(wallet, IpfsStorage, []);
    });

    it('Assigns initial balance', async () => {
        const {wait} = await token.addFile("test")
        await wait()
        expect(await token.getFile(0)).toBe("test")
    });
});
