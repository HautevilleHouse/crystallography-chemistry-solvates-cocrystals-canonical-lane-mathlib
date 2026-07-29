import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean

structure ThermalAnalysis where
  technique : String
  temperatureRange : Prod Float Float
  heatingRate : Float
  desolvationEvent : Prop
  meltingPoint : Float
  decompositionTemp : Float

structure ThermalAnalysisEvidence (T : ThermalAnalysis) where
  techniqueClosed : T.technique ∈ ["DSC", "TGA", "DTA"]
  temperatureRangeClosed : Prod.fst T.temperatureRange < Prod.snd T.temperatureRange
  heatingRateClosed : T.heatingRate > 0
  desolvationEventClosed : T.desolvationEvent
  meltingPointClosed : T.meltingPoint > 0
  decompositionTempClosed : T.decompositionTemp > T.meltingPoint

def ThermalAnalysisClosed (T : ThermalAnalysis) : Prop :=
  T.technique ∈ ["DSC", "TGA", "DTA"] ∧
  Prod.fst T.temperatureRange < Prod.snd T.temperatureRange ∧
  T.heatingRate > 0 ∧ T.desolvationEvent ∧
  T.meltingPoint > 0 ∧ T.decompositionTemp > T.meltingPoint

theorem thermal_analysis_closed_from_evidence (T : ThermalAnalysis) (E : ThermalAnalysisEvidence T) :
    ThermalAnalysisClosed T := by
  exact And.intro E.techniqueClosed
    (And.intro E.temperatureRangeClosed
      (And.intro E.heatingRateClosed
        (And.intro E.desolvationEventClosed
          (And.intro E.meltingPointClosed E.decompositionTempClosed))))

end CrystallographyChemistrySolvatesCocrystalsCanonicalLaneLean
end HautevilleHouse