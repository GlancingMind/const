open Zora

let default: zoraTestBlock = zora => {
  zora->block("Should run a test synchronously", test => {
    let answer = 3.14
    test->equal(answer, 3.14, "Should be a tasty dessert")
  })
}
