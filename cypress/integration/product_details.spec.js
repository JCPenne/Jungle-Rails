describe('Product details click Test', () => {
	it('Visits the Homepage', () => {
		cy.visit('/');
	});
	it('clicks a product to go to its details page', () => {
		cy.visit('/');
		cy.get('article').contains('Giant Tea').click();
		cy.get('.main-img').should('be.visible');
	});
});
