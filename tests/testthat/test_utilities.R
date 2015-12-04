library(DBDA2)
context("DBDA2 utility functions")

test_that("HDIofMCMC returns expected values", {
    expect_equal(HDIofMCMC(1:100), c(1, 96))
})
