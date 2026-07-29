import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure CrystalSystem where
  crystalFamily : String
  latticeCentering : String
  pointGroup : String
  bravaisLatticeType : String
  spaceGroupNumber : Nat
  symmetryOperations : List String
  unitCellConstraints : Prop

structure CrystalSystemEvidence (S : CrystalSystem) where
  crystalFamilyClosed : S.crystalFamily ≠ ""
  latticeCenteringClosed : S.latticeCentering ≠ ""
  bravaisLatticeTypeClosed : S.bravaisLatticeType ≠ ""
  spaceGroupNumberClosed : S.spaceGroupNumber > 0
  symmetryOperationsClosed : List.length S.symmetryOperations > 0
  unitCellConstraintsClosed : S.unitCellConstraints

def CrystalSystemClosed (S : CrystalSystem) : Prop :=
  S.crystalFamily ≠ "" ∧ S.latticeCentering ≠ "" ∧ S.bravaisLatticeType ≠ "" ∧
  S.spaceGroupNumber > 0 ∧ List.length S.symmetryOperations > 0 ∧ S.unitCellConstraints

theorem crystal_system_closed_from_evidence (S : CrystalSystem) (E : CrystalSystemEvidence S) :
    CrystalSystemClosed S := by
  exact And.intro E.crystalFamilyClosed
    (And.intro E.latticeCenteringClosed
      (And.intro E.bravaisLatticeTypeClosed
        (And.intro E.spaceGroupNumberClosed
          (And.intro E.symmetryOperationsClosed E.unitCellConstraintsClosed))))

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse