import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure XRDPowderPattern where
  twoThetaValues : List Float
  intensities : List Float
  wavelength : Float
  instrumentProfile : String
  braggPeaksIdentified : Prop
  phaseIdentification : Prop

structure XRDPowderPatternEvidence (X : XRDPowderPattern) where
  twoThetaValuesClosed : List.length X.twoThetaValues > 0
  intensitiesClosed : List.length X.intensities = List.length X.twoThetaValues
  wavelengthClosed : X.wavelength > 0
  instrumentProfileClosed : X.instrumentProfile ≠ ""
  braggPeaksIdentifiedClosed : X.braggPeaksIdentified
  phaseIdentificationClosed : X.phaseIdentification

def XRDPowderPatternClosed (X : XRDPowderPattern) : Prop :=
  List.length X.twoThetaValues > 0 ∧
  List.length X.intensities = List.length X.twoThetaValues ∧
  X.wavelength > 0 ∧ X.instrumentProfile ≠ "" ∧
  X.braggPeaksIdentified ∧ X.phaseIdentification

theorem xrd_powder_pattern_closed_from_evidence (X : XRDPowderPattern) (E : XRDPowderPatternEvidence X) :
    XRDPowderPatternClosed X := by
  exact And.intro E.twoThetaValuesClosed
    (And.intro E.intensitiesClosed
      (And.intro E.wavelengthClosed
        (And.intro E.instrumentProfileClosed
          (And.intro E.braggPeaksIdentifiedClosed E.phaseIdentificationClosed))))

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse