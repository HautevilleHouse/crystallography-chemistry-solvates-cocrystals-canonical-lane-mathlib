import canonicalLaneMathlib.AdmissibleClass
import CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

def ConstrainedCrystallographyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_crystallography_endgame (A : AdmissibleClass) :
    ConstrainedCrystallographyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse