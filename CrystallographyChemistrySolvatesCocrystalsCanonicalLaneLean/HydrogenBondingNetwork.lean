import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure HydrogenBondingNetwork where
  donorAtom : String
  acceptorAtom : String
  bondDistance : Float
  bondAngle : Float
  hierarchicalOrder : Prop
  synthonRecognition : Prop

structure HydrogenBondingNetworkEvidence (H : HydrogenBondingNetwork) where
  donorAtomClosed : H.donorAtom ∈ ["O", "N", "F"]
  acceptorAtomClosed : H.acceptorAtom ∈ ["O", "N", "F"]
  bondDistanceClosed : H.bondDistance > 0 ∧ H.bondDistance < 3.5
  bondAngleClosed : H.bondAngle > 90 ∧ H.bondAngle < 180
  hierarchicalOrderClosed : H.hierarchicalOrder
  synthonRecognitionClosed : H.synthonRecognition

def HydrogenBondingNetworkClosed (H : HydrogenBondingNetwork) : Prop :=
  H.donorAtom ∈ ["O", "N", "F"] ∧ H.acceptorAtom ∈ ["O", "N", "F"] ∧
  H.bondDistance > 0 ∧ H.bondDistance < 3.5 ∧
  H.bondAngle > 90 ∧ H.bondAngle < 180 ∧
  H.hierarchicalOrder ∧ H.synthonRecognition

theorem hydrogen_bonding_network_closed_from_evidence (H : HydrogenBondingNetwork) (E : HydrogenBondingNetworkEvidence H) :
    HydrogenBondingNetworkClosed H := by
  have hDist : H.bondDistance > 0 ∧ H.bondDistance < 3.5 := E.bondDistanceClosed
  have hAngle : H.bondAngle > 90 ∧ H.bondAngle < 180 := E.bondAngleClosed
  exact And.intro E.donorAtomClosed
    (And.intro E.acceptorAtomClosed
      (And.intro hDist.1
        (And.intro hDist.2
          (And.intro hAngle.1
            (And.intro hAngle.2
              (And.intro E.hierarchicalOrderClosed E.synthonRecognitionClosed))))))

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse