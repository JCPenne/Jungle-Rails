describe('Add to cart Test', () => {
	it('Visits the Homepage', () => {
		cy.visit('/');
	});
	it('Adds an item to the cart and updates the cart', () => {
		cy.visit('/');
		cy.get('article').contains('Giant Tea').click();
		cy.wait(500);
		cy.contains('Add').click();
		cy.wait(500);
		cy.contains('My Cart').contains('1');
	});
});
