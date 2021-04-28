ALTER TABLE users ADD COLUMN activatePassNotificationSend boolean;
UPDATE users SET activatePassNotificationSend = true;
ALTER TABLE users ALTER COLUMN activatePassNotificationSend SET NOT NULL;
