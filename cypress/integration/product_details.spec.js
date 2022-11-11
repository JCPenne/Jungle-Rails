describe('Product details click Test', () => {
	it('Visits the Homepage', () => {
		cy.visit('/');
	});
	it('There are 2 products on the page', () => {
		cy.get('.products article').should('have.length', 2);
	});
	it('clicks a product to go to its details page', () => {
		cy.visit('/');
		cy.get('article').contains('Giant Tea').click();
		cy.get('.main-img').should('be.visible');
	});
});
