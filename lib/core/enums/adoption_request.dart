enum AdoptionRequestStatus {
  pending,       // Submitted but not yet reviewed
  underReview,   // Being actively evaluated
  approved,      // Approved by the organization
  rejected,      // Rejected after review
  cancelled,     // Cancelled by the requester
  completed,     // Finalized, e.g., animal handed over
}
