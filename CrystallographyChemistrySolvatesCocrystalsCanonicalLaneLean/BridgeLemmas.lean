import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.spaceGroup ∧ A.object.bravaisLattice

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse