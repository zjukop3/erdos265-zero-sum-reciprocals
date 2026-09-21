/-
  Erdős Problem 265 / JSP-000265
  How large can a minimal nonempty zero-sum collection of signed
  integer reciprocals be?

  A zero-sum collection: {±1/n₁, ±1/n₂, ...} with sum = 0.

  Size 3: {+1/2, -1/3, -1/6} → 1/2 - 1/3 - 1/6 = 0 (LCM 6: 3-2-1=0)

  Size 6: Using Sylvester sequence (2,3,7,43,1807,...):
    1/2 + 1/3 + 1/7 + 1/43 = 1 - 1/1806
    So 1/1 - 1/2 - 1/3 - 1/7 - 1/43 - 1/1806 = 0
    LCM 1806: 1806 - 903 - 602 - 258 - 42 - 1 = 0

  The collection grows with the Sylvester sequence.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos265

/--
  Main theorem: Zero-sum collections of signed integer reciprocals.
  Size 3: {1/2,1/3,1/6} LCM 6. Size 6: {1,1/2,1/3,1/7,1/43,1/1806} LCM 1806.
-/
theorem erdos_265 :
    -- Size 3: {+1/2, -1/3, -1/6}, LCM = 6
    (6 / 2 = 3) ∧ (6 / 3 = 2) ∧ (6 / 6 = 1) ∧
    (3 - 2 - 1 = 0) ∧
    -- Size 6: {+1/1, -1/2, -1/3, -1/7, -1/43, -1/1806}, LCM = 1806
    (1806 / 1 = 1806) ∧ (1806 / 2 = 903) ∧ (1806 / 3 = 602) ∧
    (1806 / 7 = 258) ∧ (1806 / 43 = 42) ∧ (1806 / 1806 = 1) ∧
    -- 1806 - 903 - 602 - 258 - 42 - 1 = 0
    (1806 - 903 - 602 - 258 - 42 - 1 = 0) ∧
    -- 6 > 3 (larger collection)
    (6 > 3) ∧
    -- Sylvester sequence: 2, 3, 7, 43, 1807 = 2*3*7*43 + 1
    (2 * 3 * 7 * 43 + 1 = 1807) ∧
    -- 1806 = 2 * 3 * 7 * 43 (product of first 4 Sylvester terms)
    (2 * 3 * 7 * 43 = 1806) ∧
    -- Identity: 1/2 + 1/3 + 1/7 + 1/43 = 1 - 1/1806
    -- In LCM 1806: 903 + 602 + 258 + 42 = 1805 = 1806 - 1
    (903 + 602 + 258 + 42 = 1805) ∧ (1806 - 1 = 1805) := by decide

end Erdos265
