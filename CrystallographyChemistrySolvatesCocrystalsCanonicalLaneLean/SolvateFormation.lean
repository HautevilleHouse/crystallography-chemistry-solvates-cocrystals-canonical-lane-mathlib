import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure SolvateFormation where
  solventMolecule : String
  stoichiometry : Rat
  hostFramework : String
  inclusionEnergy : Float
  thermalStability : Prop
  characterizationMethod : String

structure SolvateFormationEvidence (S : SolvateFormation) where
  solventMoleculeClosed : S.solventMolecule ≠ ""
  stoichiometryClosed : S.stoichiometry > 0
  hostFrameworkClosed : S.hostFramework ≠ ""
  inclusionEnergyClosed : S.inclusionEnergy < 0
  thermalStabilityClosed : S.thermalStability
  characterizationMethodClosed : S.characterizationMethod ∈ ["XRD", "DSC", "TGA", "NMR"]

def SolvateFormationClosed (S : SolvateFormation) : Prop :=
  S.solventMolecule ≠ "" ∧ S.stoichiometry > 0 ∧ S.hostFramework ≠ "" ∧
  S.inclusionEnergy < 0 ∧ S.thermalStability ∧
  S.characterizationMethod ∈ ["XRD", "DSC", "TGA", "NMR"]

theorem solvate_formation_closed_from_evidence (S : SolvateFormation) (E : SolvateFormationEvidence S) :
    SolvateFormationClosed S := by
  exact And.intro E.solventMoleculeClosed
    (And.intro E.stoichiometryClosed
      (And.intro E.hostFrameworkClosed
        (And.intro E.inclusionEnergyClosed
          (And.intro E.thermalStabilityClosed E.characterizationMethodClosed))))

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse