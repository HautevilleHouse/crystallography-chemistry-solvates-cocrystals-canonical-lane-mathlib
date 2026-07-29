import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure CocrystalStoichiometry where
  componentA : String
  componentB : String
  molarRatio : Float
  coformerType : String
  hydrogenBonding : Prop
  synthonFormation : Prop

structure CocrystalStoichiometryEvidence (C : CocrystalStoichiometry) where
  componentAClosed : C.componentA ≠ ""
  componentBClosed : C.componentB ≠ ""
  molarRatioClosed : C.molarRatio > 0
  coformerTypeClosed : C.coformerType ∈ ["acid", "amide", "pyridine", "alcohol"]
  hydrogenBondingClosed : C.hydrogenBonding
  synthonFormationClosed : C.synthonFormation

def CocrystalStoichiometryClosed (C : CocrystalStoichiometry) : Prop :=
  C.componentA ≠ "" ∧ C.componentB ≠ "" ∧ C.molarRatio > 0 ∧
  C.coformerType ∈ ["acid", "amide", "pyridine", "alcohol"] ∧
  C.hydrogenBonding ∧ C.synthonFormation

theorem cocrystal_stoichiometry_closed_from_evidence (C : CocrystalStoichiometry) (E : CocrystalStoichiometryEvidence C) :
    CocrystalStoichiometryClosed C := by
  exact And.intro E.componentAClosed
    (And.intro E.componentBClosed
      (And.intro E.molarRatioClosed
        (And.intro E.coformerTypeClosed
          (And.intro E.hydrogenBondingClosed E.synthonFormationClosed))))

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse