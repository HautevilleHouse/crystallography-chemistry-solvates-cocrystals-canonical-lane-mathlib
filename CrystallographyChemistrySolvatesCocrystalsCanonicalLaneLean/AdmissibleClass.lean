import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure CrystallographyAdmittedObject where
  unitCell : Type u
  symmetryGroup : Type v
  bravaisLattice : Type w
  spaceGroup : Proposition
  diffractionPattern : Proposition
  conclusion : spaceGroup ∧ bravaisLattice

structure AdmissibleClass where
  object : CrystallographyAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.spaceGroup ∧ A.object.bravaisLattice) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse