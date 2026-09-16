// pii_masker.js
// n8n Code Node Script: Client-side PII scrubbing for POPIA Compliance

for (const item of $input.all()) {
  // Extract raw WhatsApp ID / Phone Number
  let rawPhone = item.json.body?.wa_id || item.json.wa_id || item.json.from || "";
  
  // Clean non-digit characters
  let cleanedPhone = rawPhone.replace(/\D/g, '');

  // Anonymize middle digits (e.g., 27831234567 -> 2783*****67)
  let maskedPhone = "";
  if (cleanedPhone.length >= 10) {
    maskedPhone = cleanedPhone.substring(0, 4) + "*****" + cleanedPhone.substring(cleanedPhone.length - 2);
  } else {
    maskedPhone = "ANONYMIZED_USER";
  }

  // Append sanitized identity and POPIA compliance metadata to stream
  item.json.sanitized_phone = maskedPhone;
  item.json.popia_compliant = true;
  item.json.masked_at = new Date().toISOString();
}

return $input.all();
