context("kitten")

test_that("downloads work", {
  file <- kitten(100, 100, tempfile())
  expect_true(file.exists(file))
})

test_that("stupid inputs", {
  if (Sys.getenv("RUN_LONG_TESTS", "false") != "true") {
    skip("takes too long")
  }
  ##kitten(NA, 100, tempfile())
  expect_error(kitten(c(100, 200, 300), 100, tempfile()),
               "width and height must both be scalars")
  ##kitten("pretty", "tall")
})
