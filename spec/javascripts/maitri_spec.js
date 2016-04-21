describe('Clicking "Filters" reveals filters', function () {
    it('shows "#popup" when clicked', function () {
        popupfilter();
        expect($("#popup").hasClass("open")).toBe(true);
    });
});
